import 'package:learngual_assessment/app.dart';

Row carouselDots(BuildContext context, WidgetRef ref, {required int length}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      length,
      (index) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(
            // vertical: 8.0,
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ref.watch(currentCarouselIndexProvider) == index
                ? LearnGualColor.amberColor
                : LearnGualColor.textHint,
          ),
        ),
      ),
    ),
  );
}

Container carouselWidget(BuildContext context) {
  return Container(
    height: context.sizeHeight(0.2),
    width: context.sizeWidth(0.77),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(upToSaleImg),
      ),
    ),
    child: Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Positioned(
          bottom: 1,
          right: 1,
          child: Image.asset(upToSaleAvatar),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: context.sizeWidth(0.4),
                  child: AutoSizeText(
                    TextConstant.getYourSpecialSale,
                    maxLines: 2,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: LearnGualColor.textDark,
                    ),
                  ),
                ),
                Container(
                  padding: AppEdgeInsets.eA8,
                  decoration: const BoxDecoration(
                    color: LearnGualColor.textDark,
                    borderRadius: AppBorderRadius.c8,
                  ),
                  child: Text(
                    TextConstant.shopNow,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                )
              ].columnInPadding(15)),
        ).padOnly(left: 15, bottom: 5)
      ],
    ),
  );
}
