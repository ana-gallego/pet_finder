/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/fav_fill.png
  AssetGenImage get favFill => const AssetGenImage('assets/icons/fav_fill.png');

  /// File path: assets/icons/fav_line.png
  AssetGenImage get favLine => const AssetGenImage('assets/icons/fav_line.png');

  /// File path: assets/icons/home_fill.png
  AssetGenImage get homeFill =>
      const AssetGenImage('assets/icons/home_fill.png');

  /// File path: assets/icons/home_line.png
  AssetGenImage get homeLine =>
      const AssetGenImage('assets/icons/home_line.png');

  $AssetsIconsPawsGen get paws => const $AssetsIconsPawsGen();

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// File path: assets/icons/user_fill.png
  AssetGenImage get userFill =>
      const AssetGenImage('assets/icons/user_fill.png');

  /// File path: assets/icons/user_line.png
  AssetGenImage get userLine =>
      const AssetGenImage('assets/icons/user_line.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [favFill, favLine, homeFill, homeLine, profile, userFill, userLine];
}

class $AssetsIconsPawsGen {
  const $AssetsIconsPawsGen();

  /// File path: assets/icons/paws/bird.svg
  String get bird => 'assets/icons/paws/bird.svg';

  /// File path: assets/icons/paws/cat.svg
  String get cat => 'assets/icons/paws/cat.svg';

  /// File path: assets/icons/paws/dog.svg
  String get dog => 'assets/icons/paws/dog.svg';

  /// File path: assets/icons/paws/horse.svg
  String get horse => 'assets/icons/paws/horse.svg';

  /// File path: assets/icons/paws/pig.svg
  String get pig => 'assets/icons/paws/pig.svg';

  /// List of all assets
  List<String> get values => [bird, cat, dog, horse, pig];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
