import 'package:amicus/modules/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut(()=> OnboardingController());
  }

}