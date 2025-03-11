import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/modules/dashboard/Landing/controller/dashhboard_controller.dart';
import 'package:amicus/modules/dashboard/Landing/view/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  DashboardController controller = Get.find();
  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        themeController.isThemeUpdated.value;
        return BaseScaffold(
          bottom: true,
          top: true,
          // backgroundColor: myColors.backgroundColor,
          statusBarIconBrightness: (themeController.myTheme == ThemeMode.light)
              ? Brightness.dark
              : Brightness.light,
          statusBarColor: (themeController.myTheme == ThemeMode.light)
              ? myColors.white
              : myColors.black,
          body: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Obx(
                        () {
                          return controller
                              .tabs[controller.selectedBottomBarIndex.value];
                        },
                      ),
                    ),
                  ],
                ),
                BottomBar()
              ],
            ),
          ),
        );
      },
    );
  }
}
