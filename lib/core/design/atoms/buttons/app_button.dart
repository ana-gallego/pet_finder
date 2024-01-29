import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/atoms/custom_text.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';

class AppButton extends StatelessWidget {

  const AppButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.color,
    this.buttonType = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.icon,
    this.enabled = true,
  });

  /// The text displayed on the button.
  final String text;

  /// Callback function invoked when the button is pressed.
  final void Function() onPressed;

  /// The background color of the button.
  final Color? color;

  /// Indicates whether the button should have a small size.
  final ButtonSize size;

  /// The type of button, such as primary or secondary.
  final ButtonType buttonType;

  /// An optional widget/icon displayed alongside the button text.
  final Widget? icon;

  /// Indicates whether the button is enabled or disabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(50),
      child: InkResponse(
        onTap: enabled ? onPressed : null,
        radius: 50,
        child: Ink(
          height: _getHeight(),
          width: context.width,
          decoration: BoxDecoration(
            color: _getColor(buttonType == ButtonType.primary, context),
            borderRadius: BorderRadius.circular(50),
            border: CustomBorder.all(
              color: buttonType == ButtonType.secondary
                  ? (color ?? Theme.of(context).colorScheme.primary)
                  : Colors.transparent,
            ),
          ),
          child: Padding(
            padding: context.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                  child: AppText(
                    text,
                    fontWeight: FontWeight.w500,
                    color: (buttonType == ButtonType.secondary ||
                            buttonType == ButtonType.quiet)
                        ? (color ?? Palette.blue700)
                        : Palette.white,
                  ),
                ),
                if (icon != null)
                  Container(
                    width: 16,
                    height: 16,
                    margin: context.left(8),
                    child: icon,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Retrieves the appropriate color based on button type and enabled state.
  Color _getColor(bool colored, BuildContext context) {
    return colored
        ? color ??
            (enabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withOpacity(0.5))
        : Palette.white;
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 36;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 48;
      case ButtonSize.xlarge:
        return 60;
    }
  }
}

enum ButtonType {
  primary,
  secondary,
  minimal,
  quiet,
}

enum ButtonSize {
  small,
  medium,
  large,
  xlarge,
}
