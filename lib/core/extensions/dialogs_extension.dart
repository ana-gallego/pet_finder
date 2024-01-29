import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pet_finder/core/design/atoms/app_toast.dart';
import 'package:pet_finder/core/design/organisms/dialogs/loading_dialog.dart';
import 'package:pet_finder/core/design/organisms/dialogs/message_dialog.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';

/// This extension provides convenient methods to show and manage dialogs within a [BuildContext].
///
/// It includes methods to display message dialogs, loading dialogs, and dynamic dialogs.
/// Message dialogs display a title and a message.
/// Loading dialogs display a circular loading indicator and block user interactions until dismissed.
/// Dynamic dialogs allow showing any custom [Widget] with an option to dismiss the dialog on tap outside.
///
/// Usage:
/// ```dart
/// context.showMessageDialog(
///   title: 'Alert',
///   message: 'This is an important message.',
/// );
///
/// context.showLoadingDialog();
///
/// context.hideLoadingDialog();
///
/// context.showDynamicDialog(
///   dimissible: true,
///   child: YourCustomWidget(),
/// );
/// ```
extension DialogsExtension on BuildContext {
  /// Shows a message dialog with the provided [title] and [message].
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.
  ///
  /// Usage:
  /// ```dart
  /// context.showMessageDialog(
  ///   title: 'Alert',
  ///   message: 'This is an important message.',
  /// );
  /// ```
  Future<void> showMessageDialog({
    String? title,
    String? message,
  }) async {
    await showDialog<void>(
      context: this,
      builder: (_) => MessageDialog(title: title, message: message),
    );
  }

  /// Shows a loading dialog with a circular loading indicator.
  ///
  /// The loading dialog blocks user interactions until dismissed.
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.
  ///
  /// Usage:
  /// ```dart
  /// context.showLoadingDialog();
  /// ```
  void showLoadingDialog() {
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      builder: (_) => const LoadingDialog(),
    );
  }

  /// Hides the currently displayed loading dialog.
  ///
  /// Usage:
  /// ```dart
  /// context.hideLoadingDialog();
  /// ```
  void hideLoadingDialog() => Navigator.pop(this);

  /// Shows a dynamic dialog with the provided [child] widget.
  ///
  /// The [dimisible] parameter determines whether the dialog can be dismissed
  /// by tapping outside of the dialog area.
  ///
  /// Returns a [Future] that completes when the dialog is dismissed.
  ///
  /// Usage:
  /// ```dart
  /// context.showDynamicDialog(
  ///   dimissible: true,
  ///   child: YourCustomWidget(),
  /// );
  /// ```
  Future<void> showDynamicDialog({
    required Widget child,
    bool dimisible = true,
    Color? barrierColor,
  }) async {
    await showDialog<void>(
      context: this,
      barrierDismissible: dimisible,
      barrierColor: barrierColor ?? Palette.black.withOpacity(.3),
      builder: (context) {
        return Material(color: Colors.transparent, child: child);
      },
    );
  }

  Future<dynamic> showPositionedDialog({
    required Positioned child,
    bool dimisible = true,
    bool useSafeArea = true,
    Color? barrierColor,
  }) =>
      showDialog(
        context: this,
        barrierDismissible: dimisible,
        barrierColor: barrierColor ?? Palette.black.withOpacity(.3),
        useSafeArea: useSafeArea,
        builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                width: context.width,
                height: context.height,
                child: Stack(children: [child]),
              ),
            ),
          );
        },
      );
}

ToastFuture showToast(
  String message, {
  Color? bgColor,
  Color? textColor,
  int? duration,
}) =>
    showToastWidget(
      AppToast(
        cardMessage: message,
        cardBgColor: bgColor ?? Palette.success600,
        cardTextColor: textColor ?? Palette.white,
      ),
      dismissOtherToast: true,
      duration: Duration(seconds: duration ?? 3),
      position: ToastPosition.bottom,
      handleTouch: true,
    );
