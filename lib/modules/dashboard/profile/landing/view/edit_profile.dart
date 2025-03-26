import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/app_assets.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/app_strings.dart';
import 'package:amicus/core/utills/enums/post_requst_menu_actions.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/back_widget.dart';
import 'package:amicus/core/widgets/base_scaffold.dart';
import 'package:amicus/core/widgets/custom_button.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:amicus/core/widgets/custom_text_field.dart';
import 'package:amicus/core/widgets/image_viewer.dart';
import 'package:amicus/core/widgets/shimmer/edit_profile_shimmer.dart';
import 'package:amicus/modules/dashboard/profile/landing/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  EditProfileController controller = Get.find();
  final GlobalKey _buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      top: true,
      bottom: true,
      body: Column(
        children: [
          appBarWidget(),
          Obx(
            () => controller.loadingProfile.value
                ? EditProfileShimmer()
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          avatarSection(context),
                          personalInformationSection(),
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget appBarWidget() {
    return Column(
      children: [
        CustomContainer(
          height: 56.h,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackWidget(
                hasBorder: true,
              ),
              CustomText(
                text: AppStrings.editDetails,
                fontSize: 18.sp,
                fontFamily: AppFonts.helveticaNeueBold,
                // fontColor: AppColors.black,
              ),
              SizedBox(
                height: 32.sp,
                width: 32.sp,
              ),
            ],
          ),
        ),
        Divider(
          color: myColors.grey.setOpacity(0.5),
        ),
      ],
    );
  }

  Widget avatarSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ImageViewer(
                  url: AppAssets.imgProfileBackground,
                  height: 166.h,
                  width: 168.w,
                ),
                Container(
                  height: 74.sp,
                  width: 74.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: myColors.primary, width: 2.sp)),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.loose,
                  children: [
                    Obx(() => controller.imageFile.value == null
                        ? ImageViewer(
                            url: AppAssets.imgUserProfile,
                            height: 70.sp,
                            width: 70.sp,
                            borderRadius: 77.r,
                          )
                        : Container(
                            height: 70.sp,
                            width: 70.sp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange,
                            ),
                            child: ClipOval(
                              child: Image.file(
                                controller.imageFile.value!,
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover for better fitting
                              ),
                            ),
                          )),
                    Positioned(
                      bottom: 2.h,
                      right: -5.w,
                      child: GestureDetector(
                        key: _buttonKey,
                        onTap: () {
                          _showPopupMenu(context);
                        },
                        child: Container(
                            width: 25.sp,
                            height: 25.sp,
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            decoration: BoxDecoration(
                                color: myColors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: myColors.grey.setOpacity(0.5))),
                            child: ImageViewer(url: AppAssets.iconEdit)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ).paddingOnly(top: 18.h, left: 21.w, right: 21.w);
  }

  Widget personalInformationSection() {
    return Column(
      children: [
        CustomText(
          text: "Kavin Becker",
          fontFamily: AppFonts.helveticaNeueBold,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          text: "kavinbecker1122@gmail.com",
          fontFamily: AppFonts.helveticaNeue,
          fontSize: 14.sp,
        ).paddingOnly(top: 8.h),
        editField(
            errorMsg: controller.errorName,
            iconPath: AppAssets.iconPerson,
            controller: controller.name,
            label: AppStrings.fullName,
            onChange: (value) {
              controller.validateName(value);
            }),
        editField(
            errorMsg: controller.errorPhone,
            iconPath: AppAssets.iconPhone,
            controller: controller.phoneNumberCtr,
            label: AppStrings.phoneNumber,
            onChange: (value) {
              controller.validatePhone(value);
            }),
        editField(
            errorMsg: controller.errorEmail,
            iconPath: AppAssets.iconMail,
            controller: controller.emailCtr,
            label: AppStrings.emailAddress,
            onChange: (value) {
              controller.validateEmail(value);
            }),
        Obx(
          () => CustomButton(
            buttonText: AppStrings.update,
            borderRadius: 10.r,
            onTap: () {
              controller.updateProfile();
            },
            isProcessing: controller.updating.value,
          ).marginOnly(top: 29.h, bottom: 30.h),
        )
      ],
    ).paddingOnly(top: 30.h, left: 21.w, right: 21.w);
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

        offset.dy + renderBox.size.height / 0.9, // Move slightly down
        offset.dx + renderBox.size.width - 24.w, // Shift right boundary
        offset.dy + renderBox.size.height + 100,
      ),
      color: myColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      items: [
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
            controller.selectedMenuItemIndex.value = index;
            if (action == PictureUploadMenu.uploadFromGallery) {
              controller.uploadPhotoFromGallery();
            } else {
              controller.takePhoto();
            }
            // Get.back();
          },
          child: AnimatedContainer(
            // width: 150.w,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
                color: controller.selectedMenuItemIndex.value == index
                    ? myColors.grey.setOpacity(0.25)
                    : myColors.white,
                borderRadius: BorderRadius.circular(5.r)),
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: CustomText(
              text: value,
              fontSize: 12.sp,
              fontWeight: controller.selectedMenuItemIndex.value == index
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontColor: controller.selectedMenuItemIndex.value == index
                  ? myColors.black
                  : myColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget editField(
      {required RxString errorMsg,
      String? hint,
      required String iconPath,
      required String label,
      required TextEditingController controller,
      required Function(String) onChange,
      bool? obscure,
      Widget? suffix}) {
    return SizedBox(
      // height: 50.h,
      // width: Get.width,
      child: CustomTextField(
        errorMessage: errorMsg,
        border: true,
        borderColor: myColors.grey.setOpacity(0.4),
        bgcolor: Colors.transparent,
        radius: 10.r,
        obsecureText: obscure ?? false,
        hintText: hint ?? '',
        suffixIcon: suffix,
        // style: TextStyle(color: myColors.blackNPrimary,fontSize: 15.sp,fontFamily: AppFonts.almarai ),
        // labelStyle: TextStyle(color: myColors.blackNPrimary,fontSize: 12.sp,fontFamily: AppFonts.almarai ),
        label: label,
        prefixIcon: ImageViewer(
          url: iconPath,
          width: 12.sp,
          height: 14.sp,
        ).paddingAll(14.sp),
        paddingBottom: 0.h,
        controller: controller,
        onChange: onChange,
        // contentPadding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 14.h),
      ).marginOnly(top: 24.h),
    );
  }
}
