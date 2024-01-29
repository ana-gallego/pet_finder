import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';

class ErrorHandler {
  static void handleError<T>(String message) {
    showToast(
      message,
      backgroundColor: Palette.error700,
      textStyle: const TextStyle(color: Palette.error100),
      dismissOtherToast: true,
      duration: const Duration(seconds: 3),
      position: ToastPosition.bottom,
    );
  }
}

class Error {
  Error(this.message, this.stackTrace);
  final String message;
  final dynamic stackTrace;
}
