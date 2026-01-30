/* Responsive Utility Class
   A helper class that centralizes layout logic, making it easier to handle
   screen orientation and dynamic padding across the application.

   AI Documentation
   AI Tool: Gemini 3 Pro
   [Question]
   Prompt: "Why should we create a separate 'Responsive' class instead of writing MediaQuery directly in every widget?"
   Analysis & Application:
   - Code Reusability (DRY Principle): The AI explained that repeating MediaQuery.of(context).orientation in every file leads to duplicated code.
     - Application: Encapsulated this logic into isPortrait(), making the code cleaner (e.g., Responsive.isPortrait(context)).

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-30
*/

import 'package:flutter/material.dart';
//โค้ดจากตัวอย่างในสื่อการสอนflutter-responsive-apps
class Responsive {
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