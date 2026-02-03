/* Responsive Utility Class
   A helper class that centralizes layout logic, making it easier to handle
   screen orientation, dynamic padding, and column counts across the application.

   AI Documentation
   AI Tool: Gemini 3 Pro
   [Question]
   Prompt1: "Why should we create a separate 'Responsive' class instead of writing MediaQuery directly in every widget?"
   Analysis & Application:
   - Code Reusability (DRY Principle): The AI explained that repeating MediaQuery.of(context).orientation in every file leads to duplicated code.
     - Application: Encapsulated this logic into isPortrait(), making the code cleaner (e.g., Responsive.isPortrait(context)).

   Prompt 2: "How should the column count be determined for a grid view to ensure it is responsive?"
   Analysis & Application:
   - Dynamic Layout: The AI suggested creating a method that returns an integer based on specific width thresholds to match the UI requirements for Mobile, Tablet, and Desktop.
   - Application: Implemented getColumnCount() to return 1, 2, or 3 respectively, ensuring the GridView adapts perfectly to any screen size.

   @author Duangkamon Chaithongsri
   @version 2.0.0
   @date 2026-02-03
*/

import 'package:flutter/material.dart';
//โค้ดจากตัวอย่างในสื่อการสอนflutter-responsive-apps
class Responsive {
  static const double tabletBreakpoint = 600.0;
  static const double desktopBreakpoint = 900.0;

  static bool isMobile(double width) => width < tabletBreakpoint;
  static bool isTablet(double width) =>
      width >= tabletBreakpoint && width < desktopBreakpoint;
  static bool isDesktop(double width) => width >= desktopBreakpoint;

  static int getColumnCount(double width) {
    if (isDesktop(width)) return 3;
    if (isTablet(width)) return 2;
    return 1;
  }
  //โค้ดเก่าจาก Lab 6.2
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
  static EdgeInsets getScreenPadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return const EdgeInsets.all(16.0);
    } else {
      return const EdgeInsets.all(8.0);
    }
  }
}