import 'package:learngual_assessment/app.dart';

Widget fashionableShortsWidget(BuildContext context, {required int index}) {
  return SizedBox(
    height: context.sizeHeight(0.5),
    width: context.sizeWidth(1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Image.asset(
            index.isEven ? shorts1 : shorts2,
            fit: BoxFit.fill,
          ),
        ),
        ListTile(
          title: Text(
            TextConstant.fashionableShorts.tr(),
            style: context.textTheme.titleSmall,
          ),
          subtitle: Text(
            'N10,500',
            style: context.textTheme.titleMedium,
          ),
        )
      ],
    ),
  );
}

Column fashionableShortsWidget2(
  Faker faker,
  BuildContext context, {
  List<String>? imgKeyWords,
  String? title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: AppBorderRadius.c12,
        child: cachedNetworkImageWidget(
          imgUrl: faker.image.image(keywords: imgKeyWords ?? ['Fashion']),
          height: 150,
          width: context.sizeWidth(0.4),
        ),
      ),
      ListTile(
        title: Text(
          title ?? TextConstant.fashionableShorts.tr(),
          style: context.textTheme.titleSmall,
        ),
        subtitle: Text(
          'N10,500',
          style: context.textTheme.titleMedium,
        ),
      )
    ],
  );
}
