import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/onboard/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initSharedPref();
  runApp(
    const ProviderScope(
      child: MyApp(),
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
      onGenerateTitle: (BuildContext context) => TextConstant.appTitle,
      theme: themeBuilder(defaultTheme: ThemeData.light(), isDark: false),
      darkTheme: themeBuilder(defaultTheme: ThemeData.dark(), isDark: true),
      home: const SplashScreen(),
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
              default:
                return const SignUpScreen();
            }
          },
        );
      },
    );
  }
}
