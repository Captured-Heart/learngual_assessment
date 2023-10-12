import 'package:learngual_assessment/app.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextConstant.loginToYourAccount,
                  style: context.textTheme.headlineLarge,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Flexible(
                      child: Text(TextConstant.dontHaveAnAcct),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(TextConstant.createAccount),
                    )
                  ].rowInPadding(5),
                ),
                Column(
                  children: [
                    authTextFieldWidget(
                      controller: TextEditingController(),
                      context: context,
                      label: TextConstant.emailAddress,
                      hintText: TextConstant.emailHint,
                    ),
                    authTextFieldWidget(
                      controller: TextEditingController(),
                      context: context,
                      label: TextConstant.password,
                      hintText: TextConstant.passwordMustBe,
                    ),
                  ].columnInPadding(15),
                ).padOnly(top: 10)
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // pushAsVoid(context, const HomeScreen());
                  pushAsVoid(context, const ChatHomeScreen());

                },
                child: const Text(TextConstant.login),
              ),
            )
          ],
        ).padSymmetric(horizontal: 20, vertical: 30),
      ),
    );
  }
}
