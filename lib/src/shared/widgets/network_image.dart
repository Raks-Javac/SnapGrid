import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';
import 'package:snap_grid/src/shared/resources/res.dart';

class SgWidgetsCachedNetworkImage extends StatelessWidget {
  final String url;
  final Widget? placeHolderWidget;
  final Widget? erroWidget;
  final double? width;
  final double? height;
  final BoxFit? boxFitMetrics;
  const SgWidgetsCachedNetworkImage({
    super.key,
    required this.url,
    this.placeHolderWidget,
    this.erroWidget,
    this.height,
    this.width,
    this.boxFitMetrics,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: context.width,
      imageUrl: url,
      placeholder: (context, url) => SizedBox(
        width: 100.0,
        height: 90.0,
        child: Shimmer.fromColors(
          baseColor: SgColors.normalBlack.withOpacity(0.9),
          highlightColor: SgColors.normalBlack.withOpacity(0.2),
          child: placeHolderWidget ??
              const Icon(
                Icons.image,
                size: 70,
              ),
        ),
      ),
      errorWidget: (context, url, error) =>
          erroWidget ??
          const Icon(
            Icons.error,
            size: 45,
            color: SgColors.primaryColor,
          ),
      fit: boxFitMetrics ?? BoxFit.cover,
      height: context.height,
    );
  }
}
