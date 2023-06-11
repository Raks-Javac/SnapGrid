import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/core/extensions/widget_extensions.dart';
import 'package:snap_grid/src/core/navigation/nav_export.dart';
import 'package:snap_grid/src/shared/resources/res.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      SgNavigator.pushNamedAndClear(SgRoutes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Text(
        SgStrings.kAppName,
        style: context.textTheme.titleLarge!.copyWith(
          color: SgColors.neutralBackgroundColor,
        ),
      ).center,
    );
  }
}
