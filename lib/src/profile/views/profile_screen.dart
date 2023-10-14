import 'package:learngual_assessment/app.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({super.key});
  final faker = Faker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            TextConstant.settings.toTitleCase(),
                            style: context.textTheme.bodyLarge,
                            textScaleFactor: 1.3,
                          ),

                          // THEME BUTTON
                          Card(
                            child: ListTile(
                              title: Text(TextConstant.theme.toTitleCase()),
                              leading: const Icon(nightIcon),
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
                                  TextConstant.signOut.toTitleCase(),
                                  style: context.textTheme.labelSmall
                                      ?.copyWith(fontWeight: AppFontWeight.w600),
                                  textScaleFactor: 1.5,
                                ),
                                leading: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    logOutIcon,
                                    color: LearnGualColor.textError,
                                  ),
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
}
