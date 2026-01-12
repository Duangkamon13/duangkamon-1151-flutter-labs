/* A reusable widget representing a single choice button in the quiz.
   It displays a text label on a colored background with fixed dimensions.

   Key Features:
   - Intelligent Text Contrast: Automatically determines whether the text color should be black or white
     based on the background color's brightness using 'ThemeData.estimateBrightnessForColor'.
   - Fixed Layout: Uses a Container with defined width (150) and height (60).

  @author Duangkamon Chaithongsri
  @date 2026-01-12
  @version 1.0.0
*/

import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String name;
  final Color bgColor;
  final Color? fgColor;
  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    this.fgColor
  });

  @override
  Widget build(BuildContext context) {
    final textColor = fgColor??
        (ThemeData.estimateBrightnessForColor(bgColor)== Brightness.dark ? Colors.white : Colors.black);
    return Container(
      padding: EdgeInsets.all(11.0),
      width: 150,
      height: 60,
      color: bgColor,
      child: Center(
        child: Text(name ,style: TextStyle(
          color: textColor,
        ), )
      ),
    );
  }
}
