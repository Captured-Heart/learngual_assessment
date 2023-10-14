import 'package:learngual_assessment/app.dart';

final homeScreenProvider =
    StateNotifierProvider<HomeNotifier, AuthUserState>((ref) {
  final authRepository = ref.read(authRepositoryImplProvider);

  return HomeNotifier(authRepository);
});
