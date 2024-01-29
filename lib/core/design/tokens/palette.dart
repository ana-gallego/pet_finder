///
/// The `Palette` class defines a set of color constants and color palettes.
///

// ignore_for_file: dangling_library_doc_comments

import 'package:flutter/material.dart' show Color;

abstract class Palette {
  static const Color black = Color(0xFF171717);
  static const Color white = Color(0xFFFAFAFA);
  static const Color transparent = Color(0xffffffff);

  static const Color primary = Color(0xFFffd5c6);
  static const Color primaryDark = Color(0xFF132043);

  static const Color scaffoldBackgroundColor = Color(0xFFFFD5C6);
  static const Color scaffoldBackgroundColorDark = Color(0xFF132043);

  static const Color dialogBackgroundColor = Color(0xff131313);
  static const Color dialogBackgroundColorDark = Color(0xff131313);

  static const Color bottomSheetBackgroundColor = Color(0xff131313);
  static const Color bottomSheetBackgroundColorDark = Color(0xff131313);

  static const Color hintColor = Color(0xff737373);
  static const Color hintColorDark = Color(0xff737373);

  static const Color focusColor = Color(0xff737373);
  static const Color focusColorDark = Color(0xff737373);

  static const Color textPrimaryColor = Color(0xff131313);
  static const Color textPrimaryColorDark = Color(0xff131313);

  static const Color textSecondaryColor = Color(0xff737373);
  static const Color textSecondaryColorDark = Color(0xff737373);

  static const Color blue100 = Color(0xffb3def0);
  static const Color blue700 = Color(0xff13597f);

  static const Color success600 = Color(0xff16a34a);

  static const Color error50 = Color(0xfffef2f2);
  static const Color error100 = Color(0xfffee2e2);
  static const Color error200 = Color(0xfffecaca);
  static const Color error300 = Color(0xfffca5a5);
  static const Color error400 = Color(0xfff87171);
  static const Color error500 = Color(0xffef4444);
  static const Color error600 = Color(0xffdc2626);
  static const Color error700 = Color(0xffb91c1c);
  static const Color error800 = Color(0xff991b1b);
  static const Color error900 = Color(0xff7f1d1d);


  static const Color neutral50 = Color(0xfffafafa);
  static const Color neutral100 = Color(0xfff5f5f5);
  static const Color neutral200 = Color(0xffe5e5e5);
  static const Color neutral300 = Color(0xffd4d4d4);
  static const Color neutral400 = Color(0xffa3a3a3);
  static const Color neutral500 = Color(0xff737373);
  static const Color neutral600 = Color(0xff525252);
  static const Color neutral700 = Color(0xff404040);
  static const Color neutral800 = Color(0xff262626);
  static const Color neutral900 = Color(0xff171717);
}
