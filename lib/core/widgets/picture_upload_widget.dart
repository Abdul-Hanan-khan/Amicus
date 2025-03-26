import 'dart:math';

import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/local_services/picker_service.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/enums/post_requst_menu_actions.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_dotted_button.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PictureUploadWidget extends StatelessWidget {
  RxString picturePath = ''.obs;
  String placeHolderText = '';
  RxInt selectedMenuItemIndex = 0.obs;
  Widget? widget;
  String pictureName = '';
  double height;
  bool getFromCameraOnly;

  Rx<PickerOutput>  output = PickerOutput().obs;

  Function(PickerOutput)? onImageSelected;

  // Rx<PickerOutput> ? pickerOutPut;

  PictureUploadWidget({super.key, this.onImageSelected,required this.height, required this.output, this.getFromCameraOnly =false});

  final GlobalKey _buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(
        (){
          if(output.value.fileName == null){
            return    CustomDottedButton(
                height: height,
                onTap: () {

                  if(getFromCameraOnly){
                    takePhoto(false);
                  }else{
                    _showPopupMenu(context);

                  }
                },
                buttonKey: _buttonKey,
                widget:  Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.sp,
                      height: 40.sp,
                      decoration:
                      BoxDecoration(
                          shape: BoxShape.circle, color: myColors.primary),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: myColors.white,
                        ),
                      ),
                    )
                  ],
                )
            );
          }else {
            return Container(
              color: Colors.transparent,
              width: 500,
              height: height,


                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.file(output.value.file!,fit: BoxFit.cover,)));
          }

        }
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox? renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      debugPrint("Button not rendered yet.");
      return;
    }

    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + renderBox.size.width - (150.w + 24.w),
        // Shift left by 24.w
        offset.dy + renderBox.size.height / 1.5, // Move up for half coverage
        offset.dx + renderBox.size.width - 24.w, // Shift right boundary
        offset.dy + renderBox.size.height + 100,
      ),
      color: myColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      items: [
        if (output.value.fileName != null)
          menuItem(
              index: 0,
              value: AppStrings.deletePhoto,
              action: PictureUploadMenu.deletePhoto),
        menuItem(
            index: 1,
            value: AppStrings.uploadFromGallery,
            action: PictureUploadMenu.uploadFromGallery),
        menuItem(
            index: 2,
            value: AppStrings.takeAPhoto,
            action: PictureUploadMenu.takeAPhoto),
      ],
    );
  }

  PopupMenuItem menuItem(
      {required int index,
      required String value,
      required PictureUploadMenu action}) {
    return PopupMenuItem(
      value: value,
      child: Obx(
        () => GestureDetector(
          onTap: () {
            selectedMenuItemIndex.value = index;
            if (action == PictureUploadMenu.deletePhoto) {
              deletePhoto();
            } else if (action == PictureUploadMenu.uploadFromGallery) {
              uploadPhotoFromGallery();
            } else {
              takePhoto(true);
            }
            // Get.back();
          },
          child: AnimatedContainer(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
                color: selectedMenuItemIndex.value == index
                    ? myColors.grey.setOpacity(0.25)
                    : myColors.white,
                borderRadius: BorderRadius.circular(5.r)),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: CustomText(
              text: value,
              fontSize: 12.sp,
              fontWeight: selectedMenuItemIndex.value == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontColor: selectedMenuItemIndex.value == index
                  ? myColors.black
                  : myColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  deletePhoto() {
    picturePath.value = placeHolderText;
    pictureName = placeHolderText;
    Get.back();
  }

  uploadPhotoFromGallery() {
    FilePickerService.pick(allowExtensions:  ['jpg', 'jpeg', 'png', 'heic']).then((value) {
      if (value != null) {
        pictureName = value.fileNameWithExtension ?? '';
        picturePath.value = value.path ?? "";
        if (onImageSelected != null) onImageSelected!(value);
        output.value = value;
      }
    });
    Get.back();
  }

  takePhoto(bool shouldGoBack) {
    FilePickerService.captureFromCamera().then((value) {
      if (value != null) {
        pictureName = value.fileNameWithExtension ?? '';
        picturePath.value = value.path ?? '';
        if (onImageSelected != null) onImageSelected!(value);
        output.value = value;
      }
    });
    if(shouldGoBack) {
      Get.back();
    }
  }
}
