import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:snap_grid/src/app_locator/app_providers.dart';
import 'package:snap_grid/src/core/navigation/nav_export.dart';
import 'package:snap_grid/src/shared/resources/res.dart';
import 'package:snap_grid/src/shared/resources/theme.dart';

void main() {
  runApp(const SnapGridApp());
}

class SnapGridApp extends StatelessWidget {
  const SnapGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //design frame size in the figma file for this particular app which adjust with
      //device specifics
      designSize: const Size(390, 844),
      builder: (context, widget) {
        return MultiProvider(
          providers: [...appProvider],
          child: Builder(builder: (context) {
            final appThemeProvider = context.watch<ThemeProvider>();
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: SgRouter.generateRoutes,
              navigatorKey: SgNavigator.key,
              initialRoute: SgRoutes.splashScreen,
              title: SgStrings.kAppName,
              theme: appThemeProvider.returnThemeBasedOnToggle(),
              themeMode: ThemeMode.light,
              darkTheme: SgTheme.darkTheme,
            );
          }),
        );
      },
    );
  }
}
