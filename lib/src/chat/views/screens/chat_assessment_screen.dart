// ignore_for_file: omit_local_variable_types

import 'dart:convert';
import 'dart:io';
import 'dart:math' hide log;
import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/config/api_urls.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

//ME TRYING TO UPGRADE THE WEBSOCKET URL
final webSocketFutureProvider = StreamProvider.autoDispose<IOWebSocketChannel>((ref) async* {
  Random r = Random();
  String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
  var url1 =
      'https://api-assessment.meeney.com/ws/some_path/?token=${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}';
  var client = HttpClient();
  var request = await client.getUrl(Uri.parse(url1));
  request.headers.add('connection', 'Upgrade');
  request.headers.add('upgrade', 'websocket');
  request.headers.add('Sec-WebSocket-Version', '13');
  request.headers.add('Sec-WebSocket-Key', key);
  var response = await request.close();

  var socket = await response.detachSocket();
  log('socket: ${socket.address.rawAddress}');

  final socket1 = WebSocket.fromUpgradedSocket(socket, serverSide: false);

  final channel = IOWebSocketChannel(socket1);
  yield channel;
});

// 2ND INSTANCE
final webSocketAssessmentProvider = Provider.autoDispose(
  (ref) {
    var url =
        '${ApiUrls.webSocketUrl}${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}';

    try {
      final channel = IOWebSocketChannel.connect(
        Uri.parse(url),
      );
      return channel;
    } catch (e) {
      log('the logs from websocket: $e');
    }
  },
);

class ChatAssessmentScreen extends ConsumerStatefulWidget {
  const ChatAssessmentScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatAssessmentScreenState();
}

class _ChatAssessmentScreenState extends ConsumerState<ChatAssessmentScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.mounted) {
        infoDialog();
      }
    });
    super.initState();
  }

  final TextEditingControllerClass controller = TextEditingControllerClass();
  List<String> listOfMessages = [];
  @override
  Widget build(BuildContext context) {
    final webSocket = ref.watch(webSocketAssessmentProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          'Assessment',
          style: context.textTheme.bodyMedium,
          textScaleFactor: 1.2,
        ),
        actions: [
          checkInfoBTN(
            onTap: () {
              SharedPreferencesHelper.removePref(SharedPrefKeys.assessmentDialog.name);
              infoDialog();
            },
          ),
        ].rowInPadding(10),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: webSocket?.stream,
                builder: (context, snapshot) {
                  // log('data: ${snapshot.data}');
                  listOfMessages.add(snapshot.data.toString());
                  return ListView(
                    children: List.generate(
                      listOfMessages.length,
                      (index) => chatBubbleWidget(
                        context,
                        fromUser: false,
                        index: index,
                        text: listOfMessages[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              // height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  actionBTNCard(context, icon: attachmentIcon),
                  Flexible(
                    child: authTextFieldWidget(
                      controller: controller.emailController,
                      context: context,
                      hintText: TextConstant.typeSomething.tr(),
                    ),
                  ),
                  actionBTNCard(
                    context,
                    icon: sendIcon,
                    onTap: () {
                      if (controller.emailController.text.isNotEmpty) {
                        webSocket?.sink.add(controller.emailController.text.trim());
                        log(controller.emailController.text.trim());
                        controller.emailController.clear();
                        setState(() {});
                      }
                    },
                  ),
                ].rowInPadding(5),
              ).padSymmetric(horizontal: 5),
            )
          ],
        ),
      ),
    );
  }

  Future<void> infoDialog() {
    return checkIfShowDialog(
      context: context,
      prefKey: SharedPrefKeys.assessmentDialog.name,
      title: 'Info/Guide \n(Assessment Screen)',
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'In this screen, i implemented the web Socket Url, just like was assigned to me: \n\n ${ApiUrls.webSocketUrl}${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}\n',
          ),
          InteractiveViewer(
            child: Image.asset(
              webSocketErrorPng,
              height: context.sizeHeight(0.15),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const Text(
            '\nAs seen in other screens, i implemented the websocket and got results',
          ),
        ],
      ),
    );
  }
}
