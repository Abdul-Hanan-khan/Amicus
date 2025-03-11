import 'package:flutter/widgets.dart';

extension ResponsiveSize on num {
  /// Responsive height based on screen height
  double hr(BuildContext context) {
    return (this / 812) * MediaQuery.of(context).size.height;
  }

  /// Responsive width based on screen width
  double wr(BuildContext context) {
    return (this / 375) * MediaQuery.of(context).size.width;
  }

  /// Responsive text size based on screen width
  double spr(BuildContext context) {
    return (this / 375) * MediaQuery.of(context).size.width;
  }

  /// Responsive radius based on screen width
  double rr(BuildContext context) {
    return (this / 375) * MediaQuery.of(context).size.width;
  }
}
