import 'package:get/get.dart';

class HomeController extends GetxController{
  RxDouble targetOpacityLarge = 0.0.obs;
  RxDouble targetOpacitySmall = 1.0.obs;
  toggleTargetViewLarge(){
    if(targetOpacityLarge.value ==0.0){
      targetOpacityLarge(1);
    }else{
      targetOpacityLarge(0.0);
    }
  }
  toggleTargetViewSmall(){
    if(targetOpacitySmall.value ==0.0){
      targetOpacitySmall(1);
    }else{
      targetOpacitySmall(0.0);
    }
  }
}