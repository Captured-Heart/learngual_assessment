import 'package:learngual_assessment/app.dart';
import 'package:learngual_assessment/src/onboard/models/data/repositories/auth_repository_provider.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthUserState>((ref) {
  final authRepository = ref.read(authRepositoryImplProvider);
  return AuthNotifier(authRepository);
});
