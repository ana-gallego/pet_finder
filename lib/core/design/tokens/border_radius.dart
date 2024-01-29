// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';

class AppBorderRadius {
  static const double defaultRadius = 8;

  static BorderRadiusGeometry all({double radius = defaultRadius}) {
    return BorderRadius.all(Radius.circular(radius));
  }

  static BorderRadiusGeometry topLeft({double radius = defaultRadius}) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
    );
  }

  static BorderRadiusGeometry topRight({double radius = defaultRadius}) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
    );
  }

  static BorderRadiusGeometry bottomLeft({double radius = defaultRadius}) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
    );
  }

  static BorderRadiusGeometry bottomRight({double radius = defaultRadius}) {
    return BorderRadius.only(
      bottomRight: Radius.circular(radius),
    );
  }

  static BorderRadiusGeometry bottom({double radius = defaultRadius}) {
    return BorderRadius.only(
      bottomRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    );
  }

  static BorderRadiusGeometry top({double radius = defaultRadius}) {
    return BorderRadius.only(
      topRight: Radius.circular(radius),
      topLeft: Radius.circular(radius),
    );
  }
}
