import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeObserver extends ObxWidget {
  ThemeObserver(this.child, {Key? key}) : super(key: key);


  WidgetCallback child;
  ThemeController controller = Get.find();

  Widget build() {
    controller.isThemeUpdated.value;
    return child();}


}
