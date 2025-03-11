


import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/modules/dashboard/home/home_screen.dart';
import 'package:amicus/modules/dashboard/profile/landing/view/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedBottomBarIndex = RxInt(0);

  List<Widget> tabs =  [
      HomeScreen(),
      Center(child: CustomText(text: "Report"),),
    ProfileScreen(),
  ];

  void changeScreen(int index){
    selectedBottomBarIndex.value = index;
  }
}
