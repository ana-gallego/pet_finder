import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_finder/core/design/tokens/palette.dart';

class Styles {
  /// TODO: Reemplazar por los estilos del tema y eliminar esta clase
  static TextStyle text({
    FontWeight? fontWeight,
    double? fontSize = 14,
    Color? color,
    TextDecoration? decoration,
    double? height,
    TextStyle? style,
  }) {
    // assert(
    //   fontSize != null && styleType != null,
    //   'You can either provide "fontSize" or "style", not both.',
    // );

    // assert(
    //   fontWeight != null && styleType != null,
    //   'You can either provide "fontWeight" or "style", not both.',
    // );

    // assert(
    //   height != null && styleType != null,
    //   'You can either provide "height" or "style", not both.',
    // );

    if (style != null) {
      return style.copyWith(
        fontSize: style.fontSize,
        color: color ?? Palette.black,
        decoration: decoration ?? TextDecoration.none,
      );
    }

    return GoogleFonts.inter(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize,
      color: color ?? Palette.black,
      decoration: decoration ?? TextDecoration.none,
      letterSpacing: .07,
      height: height,
    );
  }
}

abstract class AppTextStyle {
  // desktopHeading1 Text Style
  static const TextStyle desktopHeading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 48px
    letterSpacing: -0.48, // -1%
  );
  // desktopHeading2 Text Style
  static const TextStyle desktopHeading2 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 40px
    letterSpacing: -0.4, // -1%
  );
  // desktopHeading3 Text Style
  static const TextStyle desktopHeading3 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500, // medium
    height: 1, // 32px
    letterSpacing: -0.32, // -1%
  );
  // desktopHeading4 Text Style
  static const TextStyle desktopHeading4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 24px
    letterSpacing: -0.24, // -1%
  );
  // mobileHeading1 Text Style
  static const TextStyle mobileHeading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 32px
    letterSpacing: -0.32, // -1%
  );
  // mobileHeading2 Text Style
  static const TextStyle mobileHeading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 28px
    letterSpacing: -0.28, // -1%
  );
  // mobileHeading3 Text Style
  static const TextStyle mobileHeading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semi bold
    height: 1, // 24px
    letterSpacing: -0.24, // -1%
  );
  // mobi leHeading4 Text Style
  static const TextStyle mobileHeading4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 20px
    letterSpacing: -0.2, // -1%
  );
  // regularBody1 Text Style
  static const TextStyle regularBody1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400, // regular
    height: 1, // 18px
  );
  // regularBody2 Text Style
  static const TextStyle regularBody2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1, // 16px
  );
  // regularBody3 Text Style
  static const TextStyle regularBody3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.14, // 16px
  );
  // mediumBody1 Text Style
  static const TextStyle mediumBody1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500, // medium
    height: 1, // 18px
  );
  // mediumBody2 Text Style
  static const TextStyle mediumBody2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.25, // 20px
  );
  // mediumBody3 Text Style
  static const TextStyle mediumBody3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.14, // 16px
  );
  // boldBody1 Text Style
  static const TextStyle boldBody1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 18px
  );
  // boldBody2 Text Style
  static const TextStyle boldBody2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 16px
  );
  // boldBody3 Text Style
  static const TextStyle boldBody3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700, // bold
    height: 1, // 14px
  );
}
