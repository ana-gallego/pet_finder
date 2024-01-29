import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet_finder/core/extensions/breakpoints_extension.dart';

/// An extension class that provides utility methods for easily obtaining
/// dimensions and EdgeInsets based on the BuildContext's MediaQuery.
extension ContextExtension on BuildContext {
  /// Width prototipo figma
  double get referenceWidth => 428;
  Size get size => MediaQuery.of(this).size;
  double get scaleFactor {
    final scale = size.shortestSide / referenceWidth;
    return scale > 1 ? 1 : scale;
  }

  //Esto es para que no se rompa en web
  double relative(double size) {
    if (kIsWeb || isDesktop) {
      return size;
    }
    return scaleFactor * size;
  }

  /// Returns the total width of the screen.
  double get width => MediaQuery.of(this).size.width;

  /// Returns the total height of the screen.
  double get height => MediaQuery.of(this).size.height;

  EdgeInsets fromLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
      relative(left),
      relative(top),
      relative(right),
      relative(bottom),
    );
  }

  EdgeInsets symetric(double horizontal, double vertical) {
    return EdgeInsets.symmetric(
      vertical: relative(vertical),
      horizontal: relative(horizontal),
    );
  }

  EdgeInsets all(double value) => EdgeInsets.all(relative(value));

  /// Creates an EdgeInsets with only horizontal insets set to the same value.
  EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: relative(value));

  /// Creates an EdgeInsets with only vertical insets set to the same value.
  EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: relative(value));

  /// Creates an EdgeInsets with only top inset set to the specified value.
  EdgeInsets top(double value) => EdgeInsets.only(top: relative(value));

  /// Creates an EdgeInsets with only left inset set to the specified value.
  EdgeInsets left(double value) => EdgeInsets.only(left: relative(value));

  /// Creates an EdgeInsets with only right inset set to the specified value.
  EdgeInsets right(double value) => EdgeInsets.only(right: relative(value));

  /// Creates an EdgeInsets with only bottom inset set to the specified value.
  EdgeInsets bottom(double value) => EdgeInsets.only(bottom: relative(value));

  EdgeInsets only({double? left, double? top, double? right, double? bottom}) =>
      EdgeInsets.only(
        left: relative(left ?? 0),
        top: relative(top ?? 0),
        right: relative(right ?? 0),
        bottom: relative(bottom ?? 0),
      );

  double get spacing0 => relative(4);
  double get spacing1 => relative(8);
  double get spacing2 => relative(16);
  double get spacing3 => relative(24);
  double get spacing4 => relative(32);
  double get spacing5 => relative(48);
  double get spacing6 => relative(64);
  double get spacing7 => relative(80);
}
