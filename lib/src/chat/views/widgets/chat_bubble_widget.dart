
  import 'package:learngual_assessment/app.dart';

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
                  // color: index!.isEven ? context.theme.primaryColor : LearnGualColor.textHint,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white, width: 0.5),
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft: Radius.circular(index.isEven ? 10 : 0),
                        bottomRight: Radius.circular(index.isEven ? 0 : 10)),
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