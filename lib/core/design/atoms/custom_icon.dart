import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {

  const CustomIcon(
    this.pathOrUrl, {
    super.key,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
    this.fit,
  }) : assert(colorBlendMode == null || color != null,
            'Color is required when blend mode is set',);
  final String pathOrUrl;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (isUrl(pathOrUrl)) {
      return SvgPicture.network(
        pathOrUrl,
        colorFilter: _colorFilter(),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }

    return SvgPicture.asset(
      pathOrUrl,
      colorFilter: _colorFilter(),
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }

  ColorFilter? _colorFilter() {
    try {
      if (color != null && colorBlendMode == null) {
        return ColorFilter.mode(color!, BlendMode.srcIn);
      }
      if (color != null && colorBlendMode != null) {
        return ColorFilter.mode(color!, colorBlendMode!);
      }
    } catch (_) {}
    return null;
  }
}

bool isUrl(String string) {
  final RegExp urlRegex = RegExp(
    r'^((https?|ftp|file):\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    caseSensitive: false,
  );
  return urlRegex.hasMatch(string);
}
