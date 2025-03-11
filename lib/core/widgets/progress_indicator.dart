import 'package:flutter/material.dart';

class HorizontalProgressBar extends StatelessWidget {
  final double progress; // Progress value (0.0 to 1.0)
  final Color progressColor; // Color of the progress bar
  final Widget? indicatorWidget; // Optional widget to show at progress position

  const HorizontalProgressBar({
    Key? key,
    required this.progress,
    this.progressColor = Colors.blue, // Default color is blue
    this.indicatorWidget, // Optional widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progressBarWidth = MediaQuery.of(context).size.width * 0.65; // 80% of screen width

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background Progress Bar
        Container(
          width: progressBarWidth,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        ),

        // Foreground Progress Bar (Filled Part)
        Positioned(
          left: 0,
          child: Container(
            width: progressBarWidth * progress,
            height: 10,
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),

        // Optional Widget at the Progress Position
        if (indicatorWidget != null)
          Positioned(
            left: (progressBarWidth * progress) - 10, // Adjust for centering
            top: -10,
            child: indicatorWidget!,
          ),
      ],
    );
  }
}
