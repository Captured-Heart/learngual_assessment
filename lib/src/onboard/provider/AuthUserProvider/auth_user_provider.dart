import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/onboard/models/data/repositories/auth_repository_provider.dart';

final authNotifierProvider = StateNotifierProvider.autoDispose<AuthNotifier, AuthUserState>((ref) {
  final authRepository = ref.watch(authRepositoryImplProvider);
  return AuthNotifier(authRepository);
});
