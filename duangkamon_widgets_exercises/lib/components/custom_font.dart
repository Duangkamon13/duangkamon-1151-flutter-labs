/* A reusable Stateless Widget 'CustomFont' for displaying styled text.
   It creates a visual hierarchy with external margin, a styled container (background, rounded corners, shadow),
   internal padding, and text with customizable font family, size, and weight.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt: "Does this meet the requirements? (for check)"
  Prompt answer analysis and application:
  - The AI reviewed the code against the requirements and found two key issues:
    1. The required parameter was named 'textName' instead of 'text' as specified.
    2. The 'fontWeight' in TextStyle was hardcoded to 'FontWeight.w700', ignoring the parameter passed to the constructor.
  - I applied the fixes by renaming the parameter to 'text' and correctly assigning 'fontWeight: fontWeight' in the TextStyle to ensure the widget uses the provided values.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-06
*/
import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFont({
    super.key,
    required this.text,
    this.fontFamily,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8) ,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
        ),
      ),
    );
  }
}
