// ignore_for_file: avoid_field_initializers_in_const_classes, omit_local_variable_types

import 'package:learngual_assessment/app.dart';

const Color _kPrimaryLightColor = Color(0xFF2676FC);
const Color _kPrimaryDarkColor = Color(0xFF2676FC);
const Color _kBackgroundDarkColor = Color(0xFF181617);
// ignore: prefer_int_literals
const double _kIconSize = 30.0;

class AppColorTheme {
  const AppColorTheme._();

  final Color success = const Color(0xFF239f77);
  final Color onSuccess = const Color(0xFFFFFFFF);

  final Color danger = const Color(0xFFEB5757);
  final Color onDanger = const Color(0xFFFFFFFF);
}

ThemeData themeBuilder({
  required ThemeData defaultTheme,
  required bool isDark,
}) {
  final Brightness brightness = defaultTheme.brightness;
  final bool isDark = brightness == Brightness.dark;

  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: isDark ? _kPrimaryDarkColor : _kPrimaryLightColor,
    brightness: brightness,
  );
  final Color scaffoldBackgroundColor = isDark ? _kBackgroundDarkColor : colorScheme.background;

  const OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
  );
  final OutlineInputBorder textFieldErrorBorder = textFieldBorder.copyWith(
    borderSide: BorderSide(color: colorScheme.error),
  );

  final TextTheme textTheme = defaultTheme.textTheme;

  final ButtonStyle textButtonStyle = TextButton.styleFrom(
    textStyle: AppTextStyle.bodyMedium.copyWith(),
    padding: EdgeInsets.zero,
    foregroundColor: LearnGualColor.textButton,
    visualDensity: VisualDensity.compact,
  );

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    textStyle: AppTextStyle.bodyLarge.copyWith(
      color: LearnGualColor.textDark,
      fontWeight: AppFontWeight.w700,
      fontSize: 20,
    ),
    elevation: 3,
    padding: AppEdgeInsets.eA16,
    foregroundColor: LearnGualColor.textDark,
    backgroundColor: _kPrimaryDarkColor,
    shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.c8),
  );

  if (isDark == true) {
    //dark mode
    return ThemeData(
      useMaterial3: true,
      primaryColor: _kPrimaryDarkColor,
      iconTheme: defaultTheme.iconTheme.copyWith(size: _kIconSize),
      primaryIconTheme: defaultTheme.primaryIconTheme.copyWith(size: _kIconSize),
      textTheme: darkTextTheme(defaultTheme.textTheme),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
      ),
      colorScheme: colorScheme,
      // snackBarTheme: SnackBarThemeData(
      //     backgroundColor: scaffoldBackgroundColor, contentTextStyle: textTheme.bodyMedium),
      inputDecorationTheme: InputDecorationTheme(
        border: textFieldBorder,
        focusedBorder: textFieldBorder,
        enabledBorder: textFieldBorder,
        errorBorder: textFieldErrorBorder,
        focusedErrorBorder: textFieldErrorBorder,
        contentPadding: const EdgeInsets.all(12),
        filled: true,
      ),
    );
  } else {
    return ThemeData(
      useMaterial3: true,
      iconTheme: defaultTheme.iconTheme.copyWith(size: _kIconSize),
      primaryIconTheme: defaultTheme.primaryIconTheme.copyWith(size: _kIconSize),
      textTheme: lightTextTheme(defaultTheme.textTheme),
      primaryTextTheme: defaultTheme.primaryTextTheme.merge(textTheme),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
      ),
      // snackBarTheme: SnackBarThemeData(
      //     backgroundColor: scaffoldBackgroundColor, contentTextStyle: textTheme.bodyMedium),
      colorScheme: colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        border: textFieldBorder,
        focusedBorder: textFieldBorder,
        enabledBorder: textFieldBorder,
        errorBorder: textFieldErrorBorder,
        focusedErrorBorder: textFieldErrorBorder,
        contentPadding: const EdgeInsets.all(12),
        filled: true,
      ),
    );
  }
}

extension BuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension BuildContextTextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
