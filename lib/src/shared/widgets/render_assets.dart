import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SgWidgetsRenderSvg extends StatelessWidget {
  final String svgPath;
  const SgWidgetsRenderSvg({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
    );
  }
}

//image path

class SgWidgetsRenderAssetImage extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const SgWidgetsRenderAssetImage(
      {super.key, required this.imagePath, this.fit, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null) {
      return Image.asset(
        imagePath,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.asset(
        imagePath,
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      );
    }
  }
}
