// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';

class CustomBorder {
  static Border all({Color? color}) {
    return Border.fromBorderSide(
      BorderSide(color: color ?? Palette.neutral300),
    );
  }

  static Border top({Color? color}) {
    return Border(top: BorderSide(color: color ?? Palette.neutral300));
  }

  static Border bottom({Color? color}) {
    return Border(bottom: BorderSide(color: color ?? Palette.neutral300));
  }

  static Border left({Color? color}) {
    return Border(left: BorderSide(color: color ?? Palette.neutral300));
  }

  static Border right({Color? color}) {
    return Border(right: BorderSide(color: color ?? Palette.neutral300));
  }
}
