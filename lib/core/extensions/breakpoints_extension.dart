import 'package:flutter/material.dart';

extension BreakpointsExtension on BuildContext {
  bool get isMobile => deviceByWidth() == Device.mobile;
  bool get isIpad => deviceByWidth() == Device.ipad;
  bool get isDesktop => deviceByWidth() == Device.desktop;

  Device deviceByWidth() {
    final double width = MediaQuery.of(this).size.width;
    if (width >= Device.desktop.value) return Device.desktop;
    if (width >= Device.ipad.value) return Device.ipad;
    return Device.mobile;
  }
}

enum Device {
  desktop(1440), //1440
  ipad(768), // 768
  mobile(550); //550

  const Device(this.value);
  final int value;
}
