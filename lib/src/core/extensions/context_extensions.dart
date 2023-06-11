import 'package:flutter/material.dart';

//context extension
extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get deviceSize => MediaQuery.of(this).size;
  double get width => deviceSize.width;
  double get height => deviceSize.height;
}
