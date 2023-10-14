// ignore_for_file: omit_local_variable_types

import 'package:learngual_assessment/app.dart';
import 'package:web_socket_channel/io.dart';

// THE PROVIDER FOR THE WEBSOCKET CONTAINING THE IFELSE.IO URL
final webSocketIfElseProvider = Provider.autoDispose(
  (ref) {
    var url1 = 'wss://ws.ifelse.io';
    try {
      final channel = IOWebSocketChannel.connect(Uri.parse(url1));
      return channel;
    } catch (e) {
      log('the logs from websocket: $e');
    }
  },
);

class ChatIfElseScreen extends ConsumerStatefulWidget {
  const ChatIfElseScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatIfElseScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.mounted) {
        ifElseDialog();
      }
    });
    super.initState();
  }

  final TextEditingControllerClass controller = TextEditingControllerClass();
  List<String> listOfMessages = [];
  @override
  Widget build(BuildContext context) {
    final webSocket = ref.watch(webSocketIfElseProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          'IfElse.Io',
          style: context.textTheme.bodyMedium,
          textScaleFactor: 1.2,
        ),
        actions: [
          checkInfoBTN(onTap: () {
            SharedPreferencesHelper.removePref(SharedPrefKeys.ifElseDialog.name);
            ifElseDialog();
          })
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

  Future<void> ifElseDialog() {
    return checkIfShowDialog(
      context: context,
      prefKey: SharedPrefKeys.ifElseDialog.name,
      title: '${TextConstant.infoGuide.tr()} \n(IfElse.io Screen)',
      content: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '${TextConstant.inThisScreenIImplemented.tr()}, \n=> ${TextConstant.forWord.tr()} ifElse.io (${TextConstant.itsAnEchoWebsocket.tr()}): \n *** wss://ws.ifelse.io \n\n => ${TextConstant.usingTheSameMethod.tr()}\n',
          ),
          Text(TextConstant.hereWeCanPassAMessage.tr()),
          Center(child: actionBTNCard(context, icon: sendIcon)),
        ],
      ),
    );
  }
}
