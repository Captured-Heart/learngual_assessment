import 'package:learngual_assessment/app.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle headlineLarge = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w600,
    fontSize: 30,
  );

  static TextStyle headlineMedium = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w700,
    fontSize: 24,
  );

  static TextStyle listTileTitle = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w600,
    fontSize: 15,
  );
  static TextStyle listTileSubTitle = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w400,
    fontSize: 17,
  );
  static TextStyle bodySmall = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w400,
    fontSize: 13,
  );
  static TextStyle bodyMedium = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w500,
    fontSize: 15,
  );
  static TextStyle bodyLarge = GoogleFonts.urbanist(
    fontWeight: AppFontWeight.w600,
    fontSize: 16,
  );
  static TextStyle errorTextstyle = GoogleFonts.urbanist(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}

// light theme for text
TextTheme lightTextTheme(TextTheme base) {
  return base.copyWith(
    // the display in showDatePicker
    // displayMedium: ,

    //default text in app
    bodyMedium: AppTextStyle.bodyMedium.copyWith(),

    //normal titles in body text
    bodyLarge: AppTextStyle.bodyLarge.copyWith(),

    // the text in buttons
    labelLarge: AppTextStyle.bodyMedium.copyWith(),

    //for errors in textfield and Trailing in ListTile
    labelSmall: AppTextStyle.errorTextstyle.copyWith(
      color: LearnGualColor.textError,
    ),
    //
    labelMedium: AppTextStyle.bodyLarge.copyWith(),

    // the text in Appbar and dialogs
    titleLarge: AppTextStyle.bodySmall.copyWith(),

    // the Title text in  ListTiles widget
    titleMedium: AppTextStyle.listTileTitle.copyWith(),

    //
    titleSmall: AppTextStyle.listTileSubTitle.copyWith(),
    // the text in [month, year] of showDatePicker

    headlineMedium: AppTextStyle.headlineMedium,
    headlineLarge: AppTextStyle.headlineLarge,

    //
  );
}

// light theme for text
TextTheme darkTextTheme(TextTheme base) {
  return base.copyWith(
    // the display in showDatePicker
    // displayMedium: ,

    //default text in app
    bodyMedium: AppTextStyle.bodyMedium.copyWith(),

    //normal titles in body text
    bodyLarge: AppTextStyle.bodyLarge.copyWith(),

    // the text in buttons
    labelLarge: AppTextStyle.bodyMedium.copyWith(),

    //for errors in textfield
    labelSmall: AppTextStyle.errorTextstyle.copyWith(
      color: LearnGualColor.textError,
    ),
    //
    labelMedium: AppTextStyle.bodyLarge.copyWith(),

    // the text in Appbar and dialogs
    titleLarge: AppTextStyle.bodySmall.copyWith(),

    // the Title text in  ListTiles widget
    titleMedium: AppTextStyle.listTileTitle.copyWith(),

    //
    titleSmall: AppTextStyle.listTileSubTitle.copyWith(),
    // the text in [month, year] of showDatePicker
    // headlineSmall:
    headlineMedium: AppTextStyle.headlineMedium,
    headlineLarge: AppTextStyle.headlineLarge,

    //
  );
}
