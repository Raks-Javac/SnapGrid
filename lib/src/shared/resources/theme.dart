import 'package:flutter/material.dart';
import 'package:snap_grid/src/shared/resources/res.dart';

enum AppTheme {
  light,
  dark,
}

AppTheme globalAppThemeState = AppTheme.light;

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
      scaffoldBackgroundColor: SgColors.darkModeBackgroundColor,
      textTheme: SgTypography.darkTextTheme,
    );
  }
}

//notifier to listen to app theme

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme = true;

  toggleThemeMode() {
    isLightTheme = !isLightTheme;
    // this code stucture also gives room to more app themes in the future
    if (isLightTheme == true) {
      globalAppThemeState = AppTheme.light;
    } else {
      globalAppThemeState = AppTheme.dark;
    }
    notifyListeners();
  }

  ThemeData returnThemeBasedOnToggle() {
    if (globalAppThemeState == AppTheme.light) {
      return SgTheme.lightTheme;
    } else {
      return SgTheme.darkTheme;
    }
  }
}
