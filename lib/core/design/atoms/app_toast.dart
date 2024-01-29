import 'package:flutter/material.dart';

class AppToast extends StatelessWidget {
  const AppToast({
    required this.cardMessage,
    required this.cardBgColor,
    required this.cardTextColor,
    super.key,
    this.cardIconPath,
    this.action,
  });
  final String cardMessage;
  final String? cardIconPath;
  final Color cardBgColor;
  final Color cardTextColor;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
