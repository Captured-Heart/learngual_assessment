import 'package:learngual_assessment/app.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonIcon(),
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
        padding: const EdgeInsets.symmetric( vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                padding: AppEdgeInsets.eA20,
                children: [
                  chatBubbleWidget(context, fromUser: false),
                ],
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
                        controller: TextEditingController(),
                        context: context,
                        hintText: TextConstant.typeSomething),
                  ),
                  actionBTNCard(context, icon: sendIcon),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row chatBubbleWidget(BuildContext context, {required bool fromUser}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: fromUser == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
          const Icon(
            doubleCheck,
            size: 16,
          ),
          const Text('14:22')
        ].columnInPadding(5)),
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
                      faker.lorem.sentences(4).toString(),
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
