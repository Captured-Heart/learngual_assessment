// ignore_for_file: implicit_call_tearoffs

import 'package:learngual_assessment/app.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingControllerClass controllerClass =
      TextEditingControllerClass();
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(authNotifierProvider);
    return FullScreenLoader(
      isLoading: userState.isLoading,
      child: Scaffold(
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
              TextButton(
                onPressed: () {
                  pushReplaceNamed(context, NavRoutes.loginScreenRoute);
                },
                child: const Text(TextConstant.login),
              )
            ],
          ),
          Form(
            key: controllerClass.signUpformKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                authTextFieldWidget(
                  controller: controllerClass.firstNameController,
                  context: context,
                  label: TextConstant.firstName,
                  hintText: TextConstant.enterFullNameAsWritten,
                  validator: RequiredValidator(
                    errorText: AuthErrors.requiredValue.errorMessage,
                  ),
                ),
                authTextFieldWidget(
                  controller: controllerClass.lastNameController,
                  context: context,
                  label: TextConstant.lastName,
                  hintText: TextConstant.enterFullNameAsWritten,
                  validator: RequiredValidator(
                    errorText: AuthErrors.requiredValue.errorMessage,
                  ),
                ),
                authTextFieldWidget(
                  controller: controllerClass.userNameController,
                  context: context,
                  label: TextConstant.userName,
                  hintText: TextConstant.enterFullNameAsWritten,
                  validator: RequiredValidator(
                    errorText: AuthErrors.requiredValue.errorMessage,
                  ),
                ),
                authTextFieldWidget(
                  controller: controllerClass.emailController,
                  context: context,
                  label: TextConstant.emailAddress,
                  hintText: TextConstant.emailHint,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                        errorText: AuthErrors.requiredValue.errorMessage,
                      ),
                      EmailValidator(
                          errorText:
                              AuthErrors.provideAWorkingEmail.errorMessage),
                    ],
                  ),
                ),
                authTextFieldWidget(
                  controller: controllerClass.passWordController,
                  context: context,
                  label: TextConstant.password,
                  hintText: TextConstant.password,
                  validator: MultiValidator(
                    [
                      RequiredValidator(
                          errorText: AuthErrors.requiredValue.errorMessage),
                      MinLengthValidator(
                        8,
                        errorText:
                            AuthErrors.passwordMustBeAtleast.errorMessage,
                      ),
                    ],
                  ),
                ),
                authTextFieldWidget(
                  controller: controllerClass.passWordController2,
                  context: context,
                  label: TextConstant.confirmPassword,
                  hintText: TextConstant.password,
                  validator: (value) => MatchValidator(
                    errorText: AuthErrors.passwordDoesNotMatch.errorMessage,
                  ).validateMatch(controllerClass.passWordController.text,
                      controllerClass.passWordController2.text),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (controllerClass.signUpformKey.currentState!
                          .validate()) {
                        //SIGN UP
                        ref
                            .read(authNotifierProvider.notifier)
                            .signUp(
                              UsersModel(
                                firstName: controllerClass
                                    .firstNameController.text
                                    .trim(),
                                lastName: controllerClass
                                    .lastNameController.text
                                    .trim(),
                                username: controllerClass
                                    .userNameController.text
                                    .trim(),
                                email:
                                    controllerClass.emailController.text.trim(),
                                password: controllerClass
                                    .passWordController.text
                                    .trim(),
                                password2: controllerClass
                                    .passWordController2.text
                                    .trim(),
                              ).toJson(),
                              context: context,
                            )
                            .whenComplete(controllerClass.clearControllers);
                      }
                    },
                    child: const Text(TextConstant.createAccount),
                  ),
                ),
              ].columnInPadding(15),
            ),
          ),
        ],
      ).padAll(20)),
    );
  }
}
