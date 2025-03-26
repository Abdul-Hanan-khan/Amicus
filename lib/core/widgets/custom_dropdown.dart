import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final ValueChanged<String> onChanged;
  String? selectedValue;

  CustomDropdown({
    Key? key,
    required this.items,
    this.leading,
    this.trailing,
    this.width = 250,
    this.textColor = Colors.grey,
    this.fontSize = 14,
    this.borderColor = Colors.grey,
    required this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {


  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight( // Ensures height adjusts dynamically
      child: Container(
        width: widget.width,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Shrinks to fit the content
          children: [
            if (widget.leading != null) widget.leading!,
            Expanded(
              child: SizedBox(
                height: 18.h,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    isDense: true, // Reduces unnecessary padding
                    dropdownColor: myColors.containerColor,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(8.r),
                    icon: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.keyboard_arrow_down,size: 15.w,color: myColors.grey,)), // Hides dropdown arrow
                    value: widget.selectedValue ?? widget.items.first,
                    items: widget.items
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: CustomText(
                        text: item,
                        fontSize: widget.fontSize,
                        fontColor: widget.textColor,
                      ),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                          widget.selectedValue = value;
                      });
                      if (value != null) {
                        widget.onChanged(value);
                      }
                    },
                  ),
                ),
              ).marginSymmetric(vertical: 14.h),
            ),
            if (widget.trailing != null) widget.trailing!,
          ],
        ),
      ),
    );
  }
}
