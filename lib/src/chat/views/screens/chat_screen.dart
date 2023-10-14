// ignore_for_file: omit_local_variable_types

import 'dart:convert';
import 'dart:io';
import 'dart:math' hide log;
import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/config/api_urls.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketFutureProvider = StreamProvider.autoDispose<IOWebSocketChannel>((ref) async* {
  Random r = Random();
  String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
  var url1 = 'https://ws-feed.pro.coinbase.com';
  var url2 =
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
final webSocketProvider = Provider.autoDispose(
  (ref) {
    var url1 = 'wss://ws-feed.pro.coinbase.com';
    var url2 = 'wss://ws.ifelse.io';
    var url =
        '${ApiUrls.webSocketUrl}${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}';

    try {
      final channel = IOWebSocketChannel.connect(
        Uri.parse(url),
        headers: {'Connection': 'Upgrade', 'Upgrade': 'websocket'},
      );
      return channel;
    } catch (e) {
      log('the logs from websocket: $e');
    }
  },
);

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    required this.appBarTitle,
    super.key,
  });
  final String appBarTitle;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingControllerClass controller = TextEditingControllerClass();
  List<String> listOfMessages = [];
  @override
  Widget build(BuildContext context) {
    final webSocket = ref.watch(webSocketProvider);
    // ref.listen(webSocketFutureProvider, (previous, next) {});

    // final coins = ref.watch(coinWebSocketProvider);
    // log('${ApiUrls.webSocketUrl}${SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name)}');
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          widget.appBarTitle,
          style: context.textTheme.bodyMedium,
          textScaleFactor: 1.2,
        ),
        actions: [
          const Icon(vert3dots),
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
                      hintText: TextConstant.typeSomething,
                    ),
                  ),
                  actionBTNCard(
                    context,
                    icon: sendIcon,
                    onTap: () {
                      webSocket?.sink.add(
                        jsonEncode(
                          {
                            "type": "subscribe",
                            "channels": [
                              {
                                "name": "ticker",
                                "product_ids": [
                                  "BTC-EUR",
                                ]
                              }
                            ]
                          },
                        ),
                      );
                      // log(controller.emailController.text.trim());
                      controller.emailController.clear();
                      setState(() {});
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

  Row chatBubbleWidget(
    BuildContext context, {
    required bool fromUser,
    String? text,
    int? index,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: index!.isEven ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              doubleCheck,
              size: 16,
            ),
            const Text('14:22')
          ].columnInPadding(5),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: context.sizeWidth(0.6),
                child: Card(
                  elevation: 1,
                  color: fromUser == true ? context.theme.primaryColor : LearnGualColor.textHint,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: Radius.circular(fromUser == true ? 10 : 0),
                        bottomRight: Radius.circular(fromUser == true ? 0 : 10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      text ?? faker.lorem.sentences(4).toString(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: fromUser == true
                            ? LearnGualColor.textDark
                            : context.textTheme.bodyMedium!.color,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Padding chatBubbleWidget(BuildContext context, {required bool fromUser}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(6),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         SizedBox(
  //           width: context.sizeWidth(0.6),
  //           child: Card(
  //             elevation: 3,
  //             shape: RoundedRectangleBorder(
  //               side: const BorderSide(color: Colors.white, width: 0.5),
  //               borderRadius: BorderRadius.only(
  //                   topLeft: const Radius.circular(10),
  //                   topRight: const Radius.circular(10),
  //                   bottomLeft: Radius.circular(fromUser == true ? 10 : 0),
  //                   bottomRight: Radius.circular(fromUser == true ? 0 : 10)),
  //             ),
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Text(faker.lorem.sentences(4).toString()),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
