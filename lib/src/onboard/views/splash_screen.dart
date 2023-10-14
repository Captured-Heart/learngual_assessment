import 'package:learngual_assessment/app.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToNexToScreen().then((_) {
      if (SharedPreferencesHelper.getStringPref(SharedPrefKeys.tokenAccess.name).isNotEmpty) {
        pushReplaceNamed(context, NavRoutes.mainScreenRoute);
      } else {
        pushReplaceNamed(context, NavRoutes.createAccountScreenRoute);
      }
    });
  }

  Future<void> navigateToNexToScreen() async {
    return Future.delayed(const Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          appLogo,
        ),
      ),
    );
  }
}
