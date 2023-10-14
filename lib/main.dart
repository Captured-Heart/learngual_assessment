import 'package:firebase_core/firebase_core.dart';
import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/firebase_options.dart';
import 'package:learngual_assessment/src/onboard/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.initSharedPref();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
      saveLocale: true,
      path: 'assets/l10n',
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (BuildContext context) => TextConstant.appTitle.tr(),
      theme: themeBuilder(defaultTheme: ThemeData.light(), isDark: false),
      darkTheme: themeBuilder(defaultTheme: ThemeData.dark(), isDark: true),
      home:  const SplashScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case NavRoutes.createAccountScreenRoute:
                return const SignUpScreen();

              case NavRoutes.loginScreenRoute:
                return const LoginScreen();
              case NavRoutes.homeScreenRoute:
                return const HomeScreen();
              case NavRoutes.chatScreenRoute:
                return const ChatHomeScreen();
              case NavRoutes.mainScreenRoute:
                return const MainScreen();
              default:
                return const SignUpScreen();
            }
          },
        );
      },
    );
  }
}
