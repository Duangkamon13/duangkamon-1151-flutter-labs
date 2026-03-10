/*
  QuestionChoice
  This widget represents a single selectable answer choice using Container and GestureDetector.
  It transitions from its initial model-defined color to the theme's
  highlight color upon selection.
  Concepts used:
  - Stateless Architecture (State lifted to QuizApp)
  - GestureDetector for handling touch events
  - Container for custom styling and decoration
  - Conditional Logic for background and foreground colors
  Behavior:
  - Before selection: Displays the 'defaultColor' from the Choice model.
  - After selection: Switches to Theme.of(context).colorScheme.primaryContainer.
  - The text becomes bold when selected to provide clear visual feedback.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Google)

  Prompt 1:
  "How to use GestureDetector with Container for a custom button?"

  Analysis and Application:
  - The AI suggested wrapping the Container with a GestureDetector.
  - Container handles the visuals (decoration), while GestureDetector handles the logic (onTap).

  --------------------------------------------------
  Prompt 2:
  "How to change Container color based on a boolean isSelected?"
  Analysis and Application:
  - Use a ternary operator or if-else logic inside the build method.
  - If isSelected is true, use the theme color; otherwise, use the default color.
  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.3.1
  @date 2026-03-10
*/

import 'package:flutter/material.dart';

class QuestionChoiceCard extends StatelessWidget {
  final String choiceText;
  final Color defaultColor;
  final bool isSelected;
  final VoidCallback? onTap;

  const QuestionChoiceCard({
    super.key,
    required this.choiceText,
    required this.defaultColor,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color background = isSelected
        ? colorScheme.primaryContainer
        : defaultColor;

    final Color foreground = isSelected
        ? colorScheme.onPrimaryContainer
        : (ThemeData.estimateBrightnessForColor(background) == Brightness.dark
        ? Colors.white
        : Colors.black);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: background,
        ),
        child: Center(
          child: Text(
            choiceText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: foreground,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}