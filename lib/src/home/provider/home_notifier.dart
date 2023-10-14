// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:learngual_assessment/app.dart';

class HomeNotifier extends StateNotifier<AuthUserState> {
  HomeNotifier(this.authRepository)
      : super(const AuthUserState(isLoading: false));

  final AuthRepository authRepository;

/*------------------------------------------------------------------
                     HOME REQUEST METHOD
 -------------------------------------------------------------------*/
  Future<void> home({
    required BuildContext context,
  }) async {
    state = const AuthUserState(isLoading: true);
    // ignore: await_only_futures
    var result = await authRepository.home();

    state = result.fold(
      (failure) {
        log('onFailure: ${failure.body}');

        return AuthUserState(
          isLoading: false,
          errorMessage: failure.body.toString(),
        );
      },
      (onSuccess) {
        var message = jsonDecode(onSuccess.body);
        log('onSucesss: ${onSuccess.body}');

        if (context.mounted) {
          showScaffoldSnackBarMessage(
            '${message['message']}\n${dateFormatted2(DateTime.parse(message['datetime'].toString()))}',
            duration: 3,
          );
        }
        return AuthUserState(
          isLoading: false,
          userDetails: onSuccess.body,
        );
      },
    );
  }
}
