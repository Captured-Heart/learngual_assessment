import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/onboard/views/login_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      // padding: AppEdgeInsets.eA20,
      children: [
        Text(
          TextConstant.createYourAcct,
          style: context.textTheme.headlineLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(child: Text(TextConstant.haveAnAcct)),
            TextButton(onPressed: () {}, child: const Text(TextConstant.login))
          ],
        ),
        Column(
            children: [
          authTextFieldWidget(
            controller: TextEditingController(),
            context: context,
            label: TextConstant.firstName,
            hintText: TextConstant.enterFullNameAsWritten,
          ),
          authTextFieldWidget(
            controller: TextEditingController(),
            context: context,
            label: TextConstant.lastName,
            hintText: TextConstant.enterFullNameAsWritten,
          ),
          authTextFieldWidget(
            controller: TextEditingController(),
            context: context,
            label: TextConstant.userName,
            hintText: TextConstant.enterFullNameAsWritten,
          ),
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
            hintText: TextConstant.password,
          ),
          authTextFieldWidget(
            controller: TextEditingController(),
            context: context,
            label: TextConstant.confirmPassword,
            hintText: TextConstant.password,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                pushAsVoid(context, const LoginScreen());
              },
              child: const Text(TextConstant.createAccount),
            ),
          )
        ].columnInPadding(15)),
      ],
    ).padAll(20));
  }
}
