
import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_dropdown.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class DropdownWithLabel extends StatelessWidget {
  ValueChanged<String>? onChanged;
  String title;
  List<String> items;
  double? labelSize;
  String? selectedValue;

  DropdownWithLabel(
      {super.key,
        required this.items,
        required this.title,
        this.labelSize,
        this.selectedValue,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: labelSize ?? 16.sp,
          fontWeight: FontWeight.bold,
        ),
        CustomDropdown(
          items: items,
          // height: 46.h,
          selectedValue: selectedValue??items.first,
          width: double.infinity,
          borderColor: myColors.grey.setOpacity(0.4),
          textColor: myColors .grey,
          onChanged: onChanged ??
                  (selected) {
                print("User selected: $selected");
              },
        ).paddingOnly(top: 12.h),
      ],
    );
    ;
  }
}
