import 'package:flutter/material.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/shared/resources/res.dart';
import 'package:snap_grid/src/shared/resources/theme.dart';

class SgWidgetsShadowedGridView extends StatelessWidget {
  final List<Widget> items;
  final ScrollController? controller;

  const SgWidgetsShadowedGridView(
      {super.key, required this.items, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      child: GridView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 18.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: globalAppThemeState == AppTheme.light
                  ? Colors.white
                  : SgColors.normalBlack,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Material(
                color: globalAppThemeState == AppTheme.light
                    ? context.theme.scaffoldBackgroundColor
                    : SgColors.normalBlack,
                child: items[
                    index], // Replace this with your actual grid item widget
              ),
            ),
          );
        },
      ),
    );
  }
}
