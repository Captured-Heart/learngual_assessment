import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/onboard/views/splash_screen.dart';

void main() async {
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
      onGenerateTitle: (BuildContext context) => TextConstant.appTitle,

      theme: themeBuilder(defaultTheme: ThemeData.light(), isDark: false),
      darkTheme: themeBuilder(defaultTheme: ThemeData.dark(), isDark: true),
      home: SplashScreen(),
      // SignUpScreen(),
      // themeMode: settingsController.themeMode,

      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case createAccountScreenRoute:
                return const SignUpScreen();
              // case SampleItemDetailsView.routeName:
              //   return const SampleItemDetailsView();
              // case SampleItemListView.routeName:
              default:
                return const SignUpScreen();
            }
          },
        );
      },
    );
  }
}
