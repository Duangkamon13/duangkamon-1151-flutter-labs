
/*
  Choice Model
  This class is defined based on the "Implementation Hints" from the provided
  lab documentation (Problem 4: Multi-Question Quiz).

  It serves as the data model for a single answer option, storing:
  - name: The text to display.
  - isCorrect: Boolean indicating if this is the right answer.
  - displayColor: The initial background color of the choice button.

  AI Documentation
  AI Tool: I don't use any ai tools for coding

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11

*/


import 'package:flutter/material.dart';

class Choice {
  final String name;
  final bool isCorrect;
  final Color displayColor;

  const Choice({
    required this.name,
    required this.isCorrect,
    required this.displayColor,
  });
}
