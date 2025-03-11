import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget body;
  final Widget? bottomNavBar;
  final Widget? fab;
  bool? top;
  bool? bottom;
  bool? resizeToAvoidBottomInset;
  Color? backgroundColor;
  Color? statusBarColor;
  Brightness? statusBarIconBrightness;
  DeviceOrientation? deviceOrientation;

    BaseScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavBar,
    this.fab,
    this.top,
    this.bottom,
    this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.resizeToAvoidBottomInset,
    this.deviceOrientation,
    Key? key,
  }) : super(key: key);



  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: statusBarColor ??
              (statusBarIconBrightness == Brightness.light
                  ? myColors.black
                  : myColors.white),
          statusBarIconBrightness: statusBarIconBrightness?? (themeController.myTheme == ThemeMode.light? Brightness.dark:Brightness.light),
        ),
      );
    });

    return   Scaffold(
      backgroundColor: backgroundColor ?? (themeController.myTheme == ThemeMode.light? myColors.white:Colors.black),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(top: top ?? false, bottom: bottom ?? false, child: body),
      floatingActionButton: fab,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
