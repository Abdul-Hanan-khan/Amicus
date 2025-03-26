import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode myTheme = ThemeMode.light;
  RxBool isThemeUpdated = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  Future<void> loadTheme() async {
    var prefs = await EncryptedSharedPreferences().getInstance();
    bool isDark = prefs.getBool('darkThemeEnabled') ?? false;

    myTheme = isDark ? ThemeMode.dark : ThemeMode.light;
   // if(myTheme == ThemeMode.dark){
     Get.changeThemeMode(myTheme);
     // updateUiStatusBar();
     await Future.delayed(Duration(milliseconds: 500),(){
       isThemeUpdated.refresh();
     });
   // }
  }

  void toggleTheme(bool refresh) async {
    myTheme = myTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    var prefs = await EncryptedSharedPreferences().getInstance();
    await prefs.setBool('darkThemeEnabled', myTheme == ThemeMode.dark);

    updateUiStatusBar();
    Get.changeThemeMode(myTheme);

  if(refresh) {
    await Future.delayed(Duration(milliseconds: 500),(){
      isThemeUpdated.refresh();

      // isThemeUpdated.refresh();
    });
  }
  }

  void updateUiStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: myTheme == ThemeMode.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

}
