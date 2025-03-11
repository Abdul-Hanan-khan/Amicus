import 'package:amicus/core/local_services/message_service.dart';
import 'package:amicus/core/local_services/picker_service.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  RxInt currentStep = 0.obs;

  Rx<PickerOutput> sideImage = PickerOutput().obs;
  Rx<PickerOutput> frontImage = PickerOutput().obs;
  Rx<PickerOutput> backImage = PickerOutput().obs;
  Rx<PickerOutput> contextImage = PickerOutput().obs;

  RxBool uploadingImages = false.obs;
  RxBool submittingVehicleDetails = false.obs;
  RxBool showWarningAgain = false.obs;

  var licenseCtr = TextEditingController();
  var locationCtr = TextEditingController();
  var descriptionCtr = TextEditingController();

  var submittedToCtr = TextEditingController();
  var municipalityCtr = TextEditingController();
  var contactNumberCtr = TextEditingController();
  var additionalInformationCtr = TextEditingController();
  var referenceIdCtr = TextEditingController();

  RxString errorLicense = ''.obs;
  RxString errorLocation = ''.obs;
  RxString errorDescription = ''.obs;

  List<String> carMakesDDl = [
    "Toyota",
    "Honda",
    "Ford",
    "Chevrolet",
    "Nissan",
    "BMW",
    "Mercedes-Benz",
    "Audi",
    "Volkswagen",
    "Hyundai",
    "Kia",
    "Subaru",
    "Mazda",
    "Tesla",
    "Jeep",
    "Dodge",
    "Chrysler",
    "Ram",
    "Lexus",
    "Acura",
    "Infiniti",
    "Volvo",
    "Jaguar",
    "Land Rover",
    "Porsche",
    "Mitsubishi",
    "Buick",
    "Cadillac",
    "GMC",
    "Alfa Romeo"
  ];

  List<String> carModelsDDl = [
    "Corolla",
    "Civic",
    "F-150",
    "Equinox",
    "Altima",
    "3 Series",
    "C-Class",
    "A4",
    "Jetta",
    "Elantra",
    "Sorento",
    "Outback",
    "CX-5",
    "Model 3",
    "Wrangler",
    "Charger",
    "300",
    "1500",
    "RX",
    "TLX",
    "Q50",
    "XC90",
    "F-Pace",
    "Range Rover",
    "911",
    "Outlander",
    "Encore",
    "Escalade",
    "Sierra",
    "Giulia"
  ];
  List<String> carColorsDDl = [
    "White",
    "Black",
    "Silver",
    "Gray",
    "Blue",
    "Red",
    "Brown",
    "Green"
  ];

  uploadImages() async {
    List<String> images = [
      sideImage.value.fileName ?? '',
      frontImage.value.fileName ?? '',
      backImage.value.fileName ?? '',
      contextImage.value.fileName ?? '',
    ];

    int filledCount = images.where((image) => image != '').length;

    if (filledCount >= 3) {
      uploadingImages(true);
      await Future.delayed(Duration(milliseconds: 1500));
      currentStep.value = 1;
      uploadingImages(false);
    } else {
      MessageService.showSimpleDialog(
          title: AppStrings.warning,
          message: AppStrings.weRecommendToAddMinimum3Photos,
          content: Column(
            children: [
              Row(
                children: [
                  Obx(() => Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: myColors.primary,
                        fillColor: MaterialStateProperty.all(myColors.grey),
                        // focusColor: MaterialStateProperty.all(myColors.grey),

                        side: BorderSide(color: myColors.grey),
                        value: showWarningAgain.value,
                        onChanged: (value) {
                          showWarningAgain.value = value!;
                        },
                      )),
                  CustomText(
                    text: AppStrings.dontShowThat,
                    fontSize: 14.sp,
                    fontColor: myColors.grey,
                  ),
                ],
              ),
              CustomButton(
                height: 40.h,
                onTap: () {
                  Get.back();
                },
              )
            ],
          ));
    }
  }

  submitVehicleDetails() async {
    submittingVehicleDetails(true);
    await Future.delayed(Duration(milliseconds: 1500));
    currentStep.value = 2;
    submittingVehicleDetails(false);
  }
}
