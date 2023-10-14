import 'dart:async';

import 'package:learngual_assessment/app.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});
  final faker = Faker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeContext = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPlaceholder2),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // THE CIRCLE AVATAR IMAGE
          Positioned(
            top: context.sizeHeight(0.1),
            width: context.sizeWidth(1),
            child: Column(
              children: [
                CircleAvatar(
                  radius: context.sizeWidth(0.17),
                  backgroundImage: NetworkImage(
                    faker.image.image(
                      keywords: ['face', 'portrait'],
                    ),
                    scale: 0.6,
                  ),
                ),
                Text(
                  TextConstant.getFullName(),
                  style: context.textTheme.headlineLarge?.copyWith(
                    color: LearnGualColor.textFieldBorder,
                  ),
                )
              ],
            ),
          ),

          // THE WHITE CONTAINER IN THIS SCREEN

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: context.sizeHeight(0.55),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                  child: SafeArea(
                    minimum: AppEdgeInsets.eH16,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextConstant.settings.tr().toTitleCase(),
                            style: context.textTheme.bodyLarge,
                            textScaleFactor: 1.3,
                          ),

                          // THEME BUTTON
                          GestureDetector(
                            child: Card(
                              child: ListTile(
                                title: Text(TextConstant.theme.tr().toTitleCase()),
                                leading: const Icon(nightIcon),
                              ),
                            ),
                          ),

                          //LOCALE
                          GestureDetector(
                            onTap: () {
                              ref.read(hideNavBarProvider.notifier).update((state) => true);
                              Timer(const Duration(milliseconds: 500), () {
                                changeLocaleModal(context, themeContext, ref);
                              });
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(TextConstant.locale.tr().toTitleCase()),
                                leading: const Icon(nightIcon),
                              ),
                            ),
                          ),

                          /// SIGN OUT BUTTON
                          GestureDetector(
                            onTap: () {
                              ref.read(bottomNavBarIndexProvider.notifier).update((state) => 0);

                              SharedPreferencesHelper.removePref(SharedPrefKeys.tokenAccess.name);
                              pushReplacementOnRootNav(
                                context,
                                const LoginScreen(),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  TextConstant.signOut.tr().toTitleCase(),
                                  style: context.textTheme.labelSmall
                                      ?.copyWith(fontWeight: AppFontWeight.w600),
                                  textScaleFactor: 1.5,
                                ),
                                leading: const Icon(
                                  logOutIcon,
                                  color: LearnGualColor.textError,
                                ),
                              ),
                            ),
                          )
                        ].columnInPadding(15)),
                  )),
            ],
          )
        ],
      ),
    );
  }

  Future<void> changeLocaleModal(BuildContext context, ThemeData themeContext, WidgetRef ref) {
    return showModalBottomSheet(
      context: context,
      isDismissible: false,
      elevation: 4,
      backgroundColor: themeContext.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: BorderSide(color: themeContext.primaryColor, width: 0.2),
      ),
      builder: (context) => Container(
        // height: size.height * 0.2,
        margin: EdgeInsets.symmetric(horizontal: context.sizeWidth(0.1)),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: context.supportedLocales.map(
            (locale) {
              final flag = L10n.getFlag(locale.countryCode!);
              final lang = L10n.getLang(locale.countryCode!);

              return ListTile(
                onTap: () {
                  ref.read(hideNavBarProvider.notifier).update((state) => false);

                  context.setLocale(locale);
                  pop(context);
                },
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeContext.scaffoldBackgroundColor,
                    border: Border.all(color: themeContext.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    flag,
                    textScaleFactor: 1.6,
                  ),
                ),
                title: Text(
                  lang,
                  textAlign: TextAlign.start,
                  textScaleFactor: 1.3,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
