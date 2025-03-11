import 'package:amicus/core/extensions/opacity_color_extension.dart';
import 'package:amicus/core/extensions/responsive_size_extension.dart';
import 'package:amicus/core/utills/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: 6, // Show 6 shimmer placeholders
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 2) // Simulating the date separator
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: myColors.containerColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Shimmer.fromColors(
                      baseColor: myColors.shimmerBaseColor,
                      highlightColor: myColors.shimmerHighlightColor,
                      child: Container(
                        width: 120.wr(context),
                        height: 16.hr(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: myColors.grey.setOpacity(0.2)),
                  borderRadius: BorderRadius.circular(12.rr(context))),
              margin: EdgeInsets.only(top: 4.hr(context)),
              child: ListTile(
                title: Shimmer.fromColors(
                  baseColor: myColors.shimmerBaseColor,
                  highlightColor: myColors.shimmerHighlightColor,
                  child: Container(
                    height: 14,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                trailing: Shimmer.fromColors(
                  baseColor: myColors.shimmerBaseColor,
                  highlightColor: myColors.shimmerHighlightColor,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
