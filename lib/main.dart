import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/routes/app_pages.dart';
import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/modules/onboarding/bindings/initial_bindings.dart';
import 'package:amicus/modules/onboarding/view/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'core/utills/themes/theme_controller.dart';



void main() {
  Get.put(ThemeController());
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      // enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final themeController = Get.find<ThemeController>();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        title: 'Amicus',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        getPages: AppPages.routes,
        themeMode: ThemeMode.system,
        initialBinding: InitialBindings(),
        // initialRoute: AppRoutes.splashScreen,
        initialRoute: AppRoutes.dashboard,
      //
      ),
    );
  }
}
