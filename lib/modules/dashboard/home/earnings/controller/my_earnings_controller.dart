import 'dart:convert';

import 'package:amicus/modules/dashboard/home/earnings/model/my_bounties_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyEarningsController extends GetxController {
  RxBool fetchingBounties = false.obs;
  MyBountiesModel bounties = MyBountiesModel();
  RxInt selectedFilter = 2.obs;

  @override
  void onInit() {
    fetchMyBounties();
    // TODO: implement onInit
    super.onInit();
  }

  updatedBountiesBySelectedFilter(int index){
    selectedFilter(index);
  }

  Future<void> fetchMyBounties() async {
    try {
      fetchingBounties.value = true;
      String jsonString =
          await rootBundle.loadString("assets/json/my_bounties.json");
      Map<String, dynamic> jsonData = json.decode(jsonString);

      await Future.delayed(Duration(seconds: 2));

        bounties = MyBountiesModel.fromJson(jsonData);

    } catch (e) {
      debugPrint("Error loading services: $e");
    } finally {
      fetchingBounties.value = false;
    }
  }
}
