import 'package:learngual_assessment/app.dart';

Row searchWidgetRow(BuildContext context) {
  return Row(
      children: [
    Flexible(
      child: TextField(
        decoration: InputDecoration(
          fillColor: LearnGualColor.indicatorInactiveColor.withOpacity(0.5),
          //  Color(0xFFFAFAFA),
          hintText: TextConstant.search,
          hintStyle: AppTextStyle.bodyMedium,
          prefixIcon: const Icon(searchIcon),
          border: borderDesign(),
          disabledBorder: borderDesign(),
          enabledBorder: borderDesign(),
        ),
      ),
    ),
    actionBTNCard(context),
  ].rowInPadding(5));
}

Card actionBTNCard(BuildContext context, {IconData ? icon}) {
  return Card(
    shape: const RoundedRectangleBorder(
      borderRadius: AppBorderRadius.c12,
    ),
    color: context.theme.primaryColor,
    child: Icon(
     icon ?? filterIcon,
      color: context.theme.scaffoldBackgroundColor,
    ).padAll(10),
  );
}

OutlineInputBorder borderDesign() =>
    const OutlineInputBorder(borderRadius: AppBorderRadius.c12, borderSide: BorderSide.none);
