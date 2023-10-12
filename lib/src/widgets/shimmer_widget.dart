import 'package:learngual_assessment/app.dart';

Widget shimmerWidget({required Widget child}) {
  return Shimmer.fromColors(
    baseColor: LearnGualColor.indicatorActiveColor.withOpacity(0.2),
    highlightColor: LearnGualColor.indicatorInactiveColor,
    period: const Duration(milliseconds: 3000),
    child: child,
  );
}
