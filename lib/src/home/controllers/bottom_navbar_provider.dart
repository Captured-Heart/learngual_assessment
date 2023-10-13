import 'package:learngual_assessment/app.dart';

final bottomNavControllerProvider =
    Provider<PersistentTabController>((ref) => PersistentTabController());

final bottomNavBarIndexProvider = StateProvider(
  (ref) {
    final controller = ref.read(bottomNavControllerProvider);
    return controller.index;
  },
);

final hideNavBarProvider = StateProvider<bool>((ref) {
  return false;
});
