import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/app_fonts.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:amicus/core/widgets/custom_container.dart';
import 'package:amicus/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubmissionGraph extends StatelessWidget {
  RxString selectedValue = "This Week".obs;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.only(left: 20.wr(context),right: 20.wr(context),top: 20.hr(context),bottom: 10.hr(context)),
      padding: EdgeInsets.all(12.spr(context)),
      decoration: BoxDecoration(
        color: myColors.containerColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: myColors.black.setOpacity(0.2), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: myColors.grey.setOpacity(0.1),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Overall Submissions",
                      fontSize: 12.spr(context),
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 7.hr(context)),
                  CustomText(
                    text: "4,567",
                    fontSize: 18.spr(context),
                    fontFamily: AppFonts.helveticaNeueBold,
                  ),
                  SizedBox(height: 4),
                ],
              ),
              CustomContainer(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // Background color (adjust as needed)
                  borderRadius: BorderRadius.circular(5.r),
                  border: Border.all(
                      color: Colors.grey, width: 1), // Border with color
                ),
                child: DropdownButton<String>(
                  dropdownColor: myColors.blackNWhite,
                  value: "This Week",
                  items: ["This Week", "Last Week"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Obx(() => CustomText(
                            text: selectedValue.value,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedValue(value);
                  },
                  underline: SizedBox(),
                  // Removes the default underline
                  isDense: true,
                  // Reduces height
                  icon: Icon(Icons.keyboard_arrow_down), // Arrow icon
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 200.h,
            // width: 256.w,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  drawVerticalLine: false, // Disable vertical lines
                  drawHorizontalLine: true, // Enable horizontal lines
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      // Light grey color for lines
                      strokeWidth: 1, // Thin lines
                      // dashArray: [5, 5], // Dashed line effect (optional)
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.w, // Ensures space for horizontal labels
                      getTitlesWidget: (value, meta) {
                        return CustomText(
                          text: formatToK(value),
                          fontSize: 11.sp,
                          textAlign:
                              TextAlign.center, // Ensures horizontal alignment
                        );
                      },
                      interval: 2000, // Adjust interval for better readability
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.h, // Adds padding to the bottom text
                      getTitlesWidget: (value, meta) {
                        const days = [
                          "MON",
                          "TUE",
                          "WED",
                          "THU",
                          "FRI",
                          "SAT",
                          "SUN"
                        ];
                        return Padding(
                          padding: EdgeInsets.only(top: 10.h, right: 10.w),
                          // Adds required padding
                          child: CustomText(
                              text: days[value.toInt()], fontSize: 11.sp),
                        );
                      },
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 10000,
                lineBarsData: [
                  _lineChartBarData([100, 2000, 3000, 5000, 1000, 6000, 8000],
                      myColors.blueAccent),
                  _lineChartBarData([500, 1500, 4000, 2000, 5000, 7000, 9000],
                      myColors.green),
                  _lineChartBarData([700, 2500, 5000, 3000, 6000, 7500, 9500],
                      myColors.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartBarData _lineChartBarData(List<double> values, Color color) {
    return LineChartBarData(
      spots: List.generate(
          values.length, (index) => FlSpot(index.toDouble(), values[index])),
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [color.withOpacity(0.3), color.withOpacity(0.0)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  String formatToK(double number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(number % 1000 == 0 ? 0 : 1)}k';
    }
    return number.toString();
  }
}
