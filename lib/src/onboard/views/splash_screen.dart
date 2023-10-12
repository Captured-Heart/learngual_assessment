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
      pushReplacement(context, const SignUpScreen());
    });
  }

  Future<void> navigateToNexToScreen() async {
    return Future.delayed(const Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(appLogo),
      ),
    );
  }
}
