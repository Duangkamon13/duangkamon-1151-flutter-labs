/* The main entry point for the Custom Font application.
   It sets up the Material App structure, disables the debug banner, and applies a global background color.
   The core purpose is to demonstrate the usage of the 'CustomFont' widget by displaying
   the user's name with specific font styling (K2D) centered on the screen.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt: "Does this code meet the requirements? (Checking Main Screen specs)"
  Prompt answer analysis and application:
  - The AI verified the code against the checklist:
    1. Import of CustomFont: Verified.
    2. Widget Structure (MaterialApp -> Scaffold -> Center): Confirmed.
    3. CustomFont Usage: Checked parameters (Native name, 'K2D' font family, size 40.0, bold weight).
  - The AI confirmed that wrapping the CustomFont inside a Column within a Center widget is a valid approach to achieve the required centered layout.
  - I verified that the debug banner was disabled and the background color was set as requested.

  VERIFICATION:
  Manually verified on the emulator. The app displays "ดวงกมล ไชยทองศรี" in the K2D font, perfectly centered on a grey background.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-06
*/

import 'package:flutter/material.dart';
import 'components/custom_font.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomFont(
                text: "ดวงกมล ไชยทองศรี",
                fontFamily: 'K2D',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
