import 'package:learngual_assessment/app.dart';

GridView tabBarViewChildren(
  ScrollController scrollController,
  BuildContext context, {
  Widget? widget,
  int? index,
}) {
  return GridView.count(
    crossAxisCount: 2,
    controller: scrollController,
    mainAxisSpacing: 10,
    crossAxisSpacing: 15,
    childAspectRatio: 0.7,
    shrinkWrap: true,
    children: List.generate(
      index ?? 3,
      growable: true,
      (index) =>
          widget ??
          fashionableShortsWidget(
            context,
            index: index,
          ),
    ),
  );
}
