import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.icon,
    this.color,
    this.onPressed,
    this.borderColor,
    this.shape = BoxShape.rectangle,
    this.padding,
    this.customSize,
    this.borderRadius,
  });
  final Color? color;
  final Widget? icon;
  final void Function()? onPressed;
  final Color? borderColor;
  final BoxShape shape;
  final EdgeInsetsGeometry? padding;
  final double? customSize;
  final int? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: customSize ?? 32,
        height: customSize ?? 32,
        padding: padding ?? context.all(16),
        decoration: BoxDecoration(
          shape: shape,
          color: color,
          border: CustomBorder.all(color: borderColor ?? Colors.transparent),
          borderRadius:
              shape == BoxShape.rectangle ? AppBorderRadius.all() : null,
        ),
        child: icon,
      ),
    );
  }
}
