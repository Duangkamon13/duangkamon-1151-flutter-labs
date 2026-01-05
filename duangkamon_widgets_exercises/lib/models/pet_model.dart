/* Data model class 'PetModel' representing pet information.
   It encapsulates data such as name, image URL, background color, and text color.
   It provides default values for colors (Pink Accent and White) to simplify object creation.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt: "PetModel({ required this.name, ... this.backgroundColor = Colors.pinkAccent }) - What is wrong here?"
  Prompt answer analysis and application:
  - The AI explained a syntax conflict in Dart constructors: 'required' cannot be used simultaneously with a default value assignment ('=').
  - It suggested removing the 'required' keyword for parameters that have default values to make them optional.
  - I applied this by removing 'required' from 'backgroundColor' and 'textColor', allowing the model to fallback to default colors if none are provided.

  VERIFICATION:
  Manually verified by creating instances with and without color parameters.
  The default values are correctly applied when colors are omitted.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-05
*/

import 'package:flutter/material.dart';

class PetModel {
  final String name;
  final String imageURL;
  final Color backgroundColor;
  final Color textColor;

  PetModel({
    required this.name,
    required this.imageURL,
    this.backgroundColor = Colors.pinkAccent,
    this.textColor = Colors.white,
  });
}
