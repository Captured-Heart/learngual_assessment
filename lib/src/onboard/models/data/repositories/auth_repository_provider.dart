// // ignore_for_file: inference_failure_on_function_invocation

import 'package:learngual_assessment/app.dart';

final authRepositoryImplProvider = Provider.autoDispose<AuthRepository>((ref) {
  final httpClient = ref.watch(httpClientProvider);
  final authDataSource = ref.watch(authDataSourceProvider(httpClient));
  return AuthRepositoryImpl(authDataSource);
});
