import 'package:learngual_assessment/app.dart';

CachedNetworkImage cachedNetworkImageWidget({
  required String? imgUrl,
  required double height,
  double? width,
  BoxFit? fit,
  bool? isProgressIndicator = false,
  // double? loaderHeight,
  // double? loaderWidth,
}) {
  return CachedNetworkImage(
    imageUrl: imgUrl ?? noImagePlaceholderHttp,
    height: height,
    width: width,
    fit: fit ?? BoxFit.fill,
    // imageBuilder: (context, imageProvider) {
    //   return Container(
    //     decoration: BoxDecoration(
    //       shape: BoxShape.rectangle,
    //       image: DecorationImage(
    //         image: NetworkImage(imgUrl ?? noImagePlaceholderHttp),
    //         fit: BoxFit.fill,
    //       ),
    //     ),
    //   );
    // },
    progressIndicatorBuilder: (context, string, progress) {
      // ignore: use_if_null_to_convert_nulls_to_bools
      return isProgressIndicator == true
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : shimmerWidget(
              child: Container(
                alignment: Alignment.center,
                height: height,
                width: width ?? context.sizeWidth(1),
                decoration: BoxDecoration(
                  color: LearnGualColor.indicatorActiveColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
    },
    errorWidget: (context, url, error) {
      return Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage(noImagePlaceholder),
            fit: BoxFit.fill,
          ),
        ),
      );
    },
  );
}
