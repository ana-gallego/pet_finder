import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 14,
    this.overflow,
    this.height = 1,
    this.style,
  });

  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
      overflow: overflow,
      style: Styles.text(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color ?? Theme.of(context).colorScheme.tertiary,
        decoration: textDecoration,
        height: height,
        style: style,
      ),
    );
  }
}
