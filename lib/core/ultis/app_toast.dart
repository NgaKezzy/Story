import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum AppToastType { success, error, warning, info }

class AppToast {
  AppToast._();
  static ToastificationItem? _currentToast;

  static Future<void> _showToast({
    required String title,
    required String message,
    required ToastificationType type,
    Color? backgroundColor,
    required bool isDismissible,
  }) async {
    if (_currentToast != null) {
      toastification.dismiss(_currentToast!);
    }

    _currentToast = toastification.show(
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(title),
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration:
          isDismissible
              ? const Duration(days: 365)
              : const Duration(seconds: 3),
      dragToClose: true,
      backgroundColor: backgroundColor,
      showProgressBar: false,
      dismissDirection: isDismissible ? DismissDirection.none : null,
      closeButtonShowType: CloseButtonShowType.none,
    );
  }

  static void success(String message, {bool isDismissible = false}) {
    _showToast(
      title: "Thành công",
      message: message,
      type: ToastificationType.success,
      isDismissible: isDismissible,
    );
  }

  static void error(String message, {bool isDismissible = false}) {
    _showToast(
      title: "Lỗi",
      message: message,
      type: ToastificationType.error,
      isDismissible: isDismissible,
    );
  }

  static void warning(String message, {bool isDismissible = false}) {
    _showToast(
      title: "Cảnh báo",
      message: message,
      type: ToastificationType.warning,
      isDismissible: isDismissible,
    );
  }

  static void info(String message, {bool isDismissible = false}) {
    _showToast(
      title: "Thông báo",
      message: message,
      type: ToastificationType.info,
      isDismissible: isDismissible,
    );
  }

  static void toastDismiss() {
    if (_currentToast != null) {
      toastification.dismiss(_currentToast!);
    }
  }
}
