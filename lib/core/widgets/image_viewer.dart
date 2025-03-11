import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageViewer extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double? scale;
  final double borderRadius;
  final Color? color;
  final BoxFit? fit;

  const ImageViewer({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.scale,
    this.borderRadius = 0.0,
    this.color,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (url.endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
         url,
        height: height,
        width: width,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: fit ?? BoxFit.contain, // Default BoxFit for SVG
      );
    } else if (url.startsWith('http') || url.startsWith('https')) {
      imageWidget = Image.network(
        url,
        height: height,
        width: width,
        scale: scale ?? 1.0,
        fit: fit ?? BoxFit.cover, // Default BoxFit for raster images
        color: color,
      );
    } else {
      imageWidget = Image.asset(
        url,
        height: height,
        width: width,
        scale: scale ?? 1.0,
        fit: fit ?? BoxFit.cover, // Default BoxFit for local images
        color: color,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: imageWidget,
    );
  }
}
