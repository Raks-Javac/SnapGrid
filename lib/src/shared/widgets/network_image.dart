import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:snap_grid/src/core/extensions/context_extensions.dart';

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
      placeholder: (context, url) =>
          placeHolderWidget ??
          Icon(
            Icons.image,
            size: 100,
            color: context.theme.primaryColor.withOpacity(0.3),
          ),
      errorWidget: (context, url, error) =>
          erroWidget ?? const Icon(Icons.error),
      fit: boxFitMetrics ?? BoxFit.cover,
      height: context.height,
    );
  }
}
