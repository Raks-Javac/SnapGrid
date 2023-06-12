part of 'res.dart';

abstract class SgTypography {
  static String primarFontFamily = "Poppins";
  static String primaryFontBold = "PoppinsBold";
  static double fontSp30 = 30.sp;
  static double fontSp20 = 20.sp;
  static double fontSp16 = 16.sp;
  static double fontSp14 = 14.sp;
  static double fontSp12 = 12.sp;

//app textConfiguration

//light
  static TextTheme get lightTextTheme {
    return TextTheme(
      titleLarge: SgTypography.titleLarge,
      titleMedium: SgTypography.titleMedium,
      titleSmall: SgTypography.titleSmall,
      bodyMedium: SgTypography.bodyMedium,
      bodySmall: SgTypography.bodySmall,
    );
  }

  //dark
  static TextTheme get darkTextTheme {
    return TextTheme(
      titleLarge: SgTypography.titleLarge.copyWith(color: SgColors.normalBlack),
      titleMedium: SgTypography.titleMedium
          .copyWith(color: SgColors.neutralBackgroundColor),
      titleSmall: SgTypography.titleSmall
          .copyWith(color: SgColors.neutralBackgroundColor),
      bodyMedium: SgTypography.bodyMedium
          .copyWith(color: SgColors.neutralBackgroundColor),
      bodySmall: SgTypography.bodySmall
          .copyWith(color: SgColors.neutralBackgroundColor),
    );
  }

//title styles
  static TextStyle titleLarge = TextStyle(
    fontFamily: primaryFontBold,
    fontSize: fontSp30,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleMedium = TextStyle(
    fontFamily: primaryFontBold,
    fontSize: fontSp20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle titleSmall = TextStyle(
    fontFamily: primaryFontBold,
    fontSize: fontSp14,
    fontWeight: FontWeight.w600,
  );

  //body styles
  static TextStyle bodyMedium = TextStyle(
    fontFamily: primarFontFamily,
    fontSize: fontSp14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySmall = TextStyle(
    fontFamily: primarFontFamily,
    fontSize: fontSp12,
    fontWeight: FontWeight.w400,
  );
}
