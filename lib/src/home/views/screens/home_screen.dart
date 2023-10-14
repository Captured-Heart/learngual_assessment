// ignore_for_file: omit_local_variable_types

import 'dart:convert';

import 'package:learngual_assessment/app.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        ref.read(homeScreenProvider.notifier).home(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    var faker = Faker();
    List<String> tabsString = [
      TextConstant.all.tr(),
      TextConstant.fashion.tr(),
      TextConstant.sport.tr(),
      TextConstant.phones.tr(),
      TextConstant.electronics.tr(),
    ];
// log(SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenRefresh.name));
    return DefaultTabController(
      length: tabsString.length,
      child: Scaffold(
        //APP BAR
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 60,
          titleSpacing: 15,
          toolbarHeight: kToolbarHeight * 1.4,
          leading: GestureDetector(
            onTap: () {
              // ref.read(authNotifierProvider.notifier).home(context: context);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                faker.image.image(
                  keywords: ['face', 'portrait'],
                ),
                scale: 0.6,
              ),
            ).padOnly(left: 10),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(TextConstant.hello),
              Text(
                TextConstant.getFullName(),
                textScaleFactor: 0.9,
                style: context.textTheme.bodyMedium?.copyWith(fontWeight: AppFontWeight.w700),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {
                SharedPreferencesHelper.removePref(SharedPrefKeys.tokenAccess.name);
                pushReplacementOnRootNav(
                  context,
                  const LoginScreen(),
                );
              },
              child: Text(TextConstant.signOut.tr()),
            ),
          ].rowInPadding(15),
          centerTitle: false,
        ),

        //BODY OF THE SCREEN
        body: ListView(
          controller: scrollController,
          padding: AppEdgeInsets.eH20,
          children: [
            //SEARCH WIDGET
            searchWidgetRow(context),
            Row(
              children: [
                Expanded(child: Text(TextConstant.popularItems.tr())),
                Text(TextConstant.viewAll.tr()),
              ],
            ),

            //CAROUSEL SLIDER
            Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: carouselWidgetList(context),
                  carouselController: ref.watch(carouselSliderProvider),
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    // enlargeCenterPage: true,
                    // viewportFraction: 0.7,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      ref.read(currentCarouselIndexProvider.notifier).update((state) => index);
                    },
                  ),
                ),
                carouselDots(
                  context,
                  ref,
                  length: carouselWidgetList(context).length,
                ),
              ].columnInPadding(15),
            ),

            // THE TAB BAR OF ['ALL', 'FASHION', 'SPORTS', 'PHONES', 'ELECTRONICS']
            TabBar(
              isScrollable: true,
              labelColor: context.textTheme.bodyMedium!.color,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: LearnGualColor.indicatorActiveColor,
              splashFactory: NoSplash.splashFactory,
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => states.contains(MaterialState.selected) ? null : Colors.transparent,
              ),
              onTap: (value) {
                log(value.toString());
              },

              // THE TABS BEARING THE CHILDREN
              tabs: List.generate(
                5,
                (index) => Tab(
                  text: tabsString[index].toTitleCase(),
                ),
                growable: true,
              ),
            ),
            SizedBox(
              height: context.sizeHeight(0.5),
              child: TabBarView(
                children: [
                  tabBarViewChildren(scrollController, context),
                  tabBarViewChildren(
                    scrollController,
                    context,
                    widget: fashionableShortsWidget2(faker, context),
                  ),
                  tabBarViewChildren(
                    scrollController,
                    context,
                    index: 5,
                    widget: fashionableShortsWidget2(
                      faker,
                      context,
                      imgKeyWords: ['Sports', 'football'],
                      title: faker.sport.name(),
                    ),
                  ),
                  tabBarViewChildren(
                    scrollController,
                    context,
                    widget: fashionableShortsWidget2(
                      faker,
                      context,
                      imgKeyWords: ['devices', 'mobile', 'phone'],
                      title: faker.internet.userName(),
                    ),
                  ),
                  tabBarViewChildren(
                    scrollController,
                    context,
                    widget: fashionableShortsWidget2(
                      faker,
                      context,
                      imgKeyWords: ['electronics', 'gadgets'],
                      title: faker.company.name(),
                    ),
                  ),
                ],
              ),
            ),
            //
          ].columnInPadding(30),
        ),
      ),
    );
  }

  List<Widget> carouselWidgetList(BuildContext context) {
    return [
      carouselWidget(context),
      carouselWidget(context),
      carouselWidget(context),
      carouselWidget(context),
    ];
  }
}
