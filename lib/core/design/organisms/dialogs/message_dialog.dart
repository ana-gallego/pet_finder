import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({
    super.key,
    this.title,
    this.message,
  });

  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Dialog(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title ?? ''),
              Text(message ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
