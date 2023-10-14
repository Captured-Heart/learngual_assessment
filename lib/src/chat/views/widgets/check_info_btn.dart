
  import 'package:learngual_assessment/app.dart';

GestureDetector checkInfoBTN({
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: LearnGualColor.amberColor),
          borderRadius: AppBorderRadius.c12,
        ),
        child:  Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          const  Icon(
              warningIcon,
              color: LearnGualColor.amberColor,
            ),
            Text(TextConstant.checkInfo.tr()),
          ],
        ).padAll(5),
      ),
    );
  }