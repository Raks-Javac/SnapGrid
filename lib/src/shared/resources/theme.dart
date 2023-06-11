import 'package:flutter/material.dart';
import 'package:snap_grid/src/shared/resources/res.dart';

abstract class SgTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: SgColors.primaryColor,
      scaffoldBackgroundColor: SgColors.neutralBackgroundColor,
      textTheme: SgTypography.lightTextTheme,
    );
  }

  //darkTheme
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: SgColors.primaryColor,
      scaffoldBackgroundColor: SgColors.neutralBackgroundColor,
      textTheme: SgTypography.darkTextTheme,
    );
  }
}
