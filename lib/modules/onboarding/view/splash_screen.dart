import 'package:amicus/core/routes/app_routes.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/utills/themes/theme_controller.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeController themeController = Get.find();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.landing);
    });
    // TODO: implement initState
    super.initState();
  }

  // MyColors get myColors =>
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
          backgroundColor: myColors.white,
            statusBarIconBrightness: Brightness.dark,
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: Get.width,
            ),
            ImageViewer(
              url: AppAssets.appLogo,
              color: Colors.black,
            ),
          ],
        ));


  }
}
