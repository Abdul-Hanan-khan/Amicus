import 'package:flutter/material.dart';

extension OpacityColorExtension on Color {
  Color setOpacity(double opacity) {
    return withAlpha((opacity.clamp(0.0, 1.0) * 255).toInt());
  }
}
