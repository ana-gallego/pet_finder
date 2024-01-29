import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: color ?? Palette.blue100);
  }
}
