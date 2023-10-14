// ignore_for_file: implicit_call_tearoffs

import 'package:learngual_assessment/app.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingControllerClass controllerClass =
      TextEditingControllerClass();
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(authNotifierProvider);
    return FullScreenLoader(
      isLoading: userState.isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TextConstant.loginToYourAccount.tr(),
                    style: context.textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       Flexible(
                        child: Text(TextConstant.dontHaveAnAcct.tr()),
                      ),
                      TextButton(
                        onPressed: () {
                          pushReplaceNamed(
                              context, NavRoutes.createAccountScreenRoute);
                        },
                        child:  Text(TextConstant.createAccount.tr()),
                      )
                    ].rowInPadding(5),
                  ),
                  Form(
                    key: controllerClass.signInformKey,
                    child: Column(
                      children: [
                        authTextFieldWidget(
                          controller: controllerClass.userNameController,
                          context: context,
                          label: TextConstant.userName.tr(),
                          hintText: TextConstant.userName.tr(),
                          validator: RequiredValidator(
                              errorText: AuthErrors.requiredValue.errorMessage),
                          // validator: MultiValidator(
                          //   [
                          //     RequiredValidator(
                          //       errorText: AuthErrors.requiredValue.errorMessage,
                          //     ),
                          //     EmailValidator(errorText: AuthErrors.provideAWorkingEmail.errorMessage),
                          //   ],
                          // ),
                        ),
                        authTextFieldWidget(
                          controller: controllerClass.passWordController,
                          context: context,
                          label: TextConstant.password.tr(),
                          hintText: TextConstant.passwordMustBe.tr(),
                          validator: RequiredValidator(
                              errorText: AuthErrors.requiredValue.errorMessage),
                        ),
                      ].columnInPadding(15),
                    ).padOnly(top: 10),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controllerClass.signInformKey.currentState!
                        .validate()) {
                      ref.read(authNotifierProvider.notifier).signIn(
                        {
                          'username':
                              controllerClass.userNameController.text.trim(),
                          // 'email': controllerClass.emailController.text.trim(),
                          'password':
                              controllerClass.passWordController.text.trim()
                        },
                        context: context,
                        ref: ref,
                      );
                    }
                  },
                  child:  Text(TextConstant.login.tr()),
                ),
              )
            ],
          ).padSymmetric(horizontal: 20, vertical: 30),
        ),
      ),
    );
  }
}
