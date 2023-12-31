// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:learngual_assessment/app.dart';

class AuthNotifier extends StateNotifier<AuthUserState> {
  AuthNotifier(this.authRepository)
      : super(const AuthUserState(isLoading: false));

  final AuthRepository authRepository;
  /*------------------------------------------------------------------
                      SIGN UP USERS METHOD
 -------------------------------------------------------------------*/
  Future<void> signUp(
    Map<String, dynamic> body, {
    required BuildContext context,
  }) async {
    state = const AuthUserState(isLoading: true);
    // ignore: await_only_futures
    var result = await authRepository.signUp(body);
    state = result.fold(
      (failure) {
        if (context.mounted) {
          showAuthBottomSheet(
              context: context, errorMessage: failure.body.toString());
        }
        return AuthUserState(
          isLoading: false,
          errorMessage: failure.body.toString(),
        );
      },
      (onSuccess) {
        log('onSucesss: ${onSuccess.body}');
        SharedPreferencesHelper.setStringPref(
            SharedPrefKeys.signUpDetails.name, onSuccess.body);
        if (context.mounted) {
          showScaffoldSnackBarMessage('Sign up successfully');
          //NAVIGATING TO THE LOGIN SCREEN AFTER SIGN UP
          pushReplaceNamed(context, NavRoutes.loginScreenRoute);
        }
        return AuthUserState(
          isLoading: false,
          userDetails: onSuccess.body,
        );
      },
    );
  }

  /*------------------------------------------------------------------
                      SIGN IN USERS METHOD
 -------------------------------------------------------------------*/
  Future<void> signIn(
    Map<String, dynamic> body, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    state = const AuthUserState(isLoading: true);
    // ignore: await_only_futures
    var result = await authRepository.signIn(body);
    state = result.fold(
      (failure) {
        if (context.mounted) {
          showAuthBottomSheet(
              context: context, errorMessage: failure.body.toString());
        }
        return AuthUserState(
          isLoading: false,
          errorMessage: failure.body.toString(),
        );
      },
      (onSuccess) {
        var token = jsonDecode(onSuccess.body);
        log('onSucesss: ${onSuccess.body}, token: ${token['access']}');
        if (context.mounted) {
          showScaffoldSnackBarMessage('Logged in successfully');
          SharedPreferencesHelper.setStringPref(
              SharedPrefKeys.tokenRefresh.name, token['refresh'].toString());
          SharedPreferencesHelper.setStringPref(
              SharedPrefKeys.tokenAccess.name, token['access'].toString());

          //NAVIGATING TO THE HOMESCREEN AFTER SIGNING IN
          pushAsVoid(context, const MainScreen());
        }
        return AuthUserState(
          isLoading: false,
          userDetails: onSuccess.body,
        );
      },
    );
  }
}
