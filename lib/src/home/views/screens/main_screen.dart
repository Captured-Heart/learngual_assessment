// ignore_for_file: omit_local_variable_types

import 'package:learngual_assessment/app.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ref.watch(scaffoldKeyProvider),
      body: PersistentTabView(
        context,
        padding: const NavBarPadding.symmetric(horizontal: 10, vertical: 15),
        controller: ref.watch(bottomNavControllerProvider),
        navBarStyle: NavBarStyle.style7,
        hideNavigationBar: ref.watch(hideNavBarProvider),
        navBarHeight: kBottomNavigationBarHeight * 1.2,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popAllScreensOnTapAnyTabs: false,
        confineInSafeArea: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        onItemSelected: (value) {
          log(value.toString());
          ref.read(bottomNavBarIndexProvider.notifier).update((state) => value);
        },
        items: navBarsItems(context: context),
        screens: [
          const HomeScreen(),
          const ChatHomeScreen(),
          const LocationScreen(),
          ProfileScreen()
        ],
        decoration: const NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.black,
          boxShadow: [
            BoxShadow(
              color: LearnGualColorLight.textLight,
              blurRadius: 1,
              spreadRadius: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> navBarsItems({required BuildContext context}) {
  TextStyle itemTextStyle = context.theme.textTheme.bodyMedium!.copyWith(
    fontWeight: AppFontWeight.w700,
  );
  return [
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(homeIcon), //cottage_outlined
      title: TextConstant.home.tr(),
      iconSize: 24,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: LearnGualColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(mailIcon),
      title: TextConstant.chat.tr(),
      iconSize: 24,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: LearnGualColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(locationIcon),
      iconSize: 25,
      title: TextConstant.location.tr(),
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: LearnGualColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    ),
    PersistentBottomNavBarItem(
      textStyle: itemTextStyle,
      icon: const Icon(personIcon),
      title: TextConstant.profile.tr(),
      iconSize: 28,
      activeColorPrimary: context.theme.primaryColor,
      inactiveColorPrimary: LearnGualColorLight.textHint,
      activeColorSecondary: context.theme.scaffoldBackgroundColor,
    )
  ];
}
