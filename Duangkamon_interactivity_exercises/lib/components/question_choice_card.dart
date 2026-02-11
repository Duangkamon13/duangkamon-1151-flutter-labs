/*
  QuestionChoiceCard

  This widget represents an individual answer choice within a multi-question quiz.
  It functions as a stateless-looking interactive card that provides real-time
  visual feedback by changing colors based on the correctness of the answer
  once a selection has been made.

  Concepts used:
  - StatefulWidget: To manage the widget's lifecycle and react to parent state changes.
  - Callback Pattern (onSelected): To notify the parent widget when a choice is picked.
  - Conditional Styling: Dynamically changing background colors (Green/Red/Default).
  - Accessibility (Contrast): Using estimateBrightnessForColor to ensure text is readable.
  - Gesture Interaction: Using GestureDetector with a guard clause to disable multiple taps.

  Behavior:
  - Initial State: Displays the choice name with the background color defined in the model.
  - Selection State (selectionMade = true):
      * Background turns GREEN if the choice is correct.
      * Background turns RED if the choice was selected by the user but is incorrect.
      * Background remains at its default or a neutral color if not selected.
  - Safety: Tapping is disabled once a selection has been recorded to prevent score tampering.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Google)

  Prompt 1:
  "How can I automatically change the text color to white or black based on the
   background color in Flutter?"

  Analysis and Application:
  - The AI suggested using `ThemeData.estimateBrightnessForColor(color)`.
  - It checks if the background is 'dark' or 'light'.
  - This was applied to the `textColor` variable to ensure readability on both
    red/green (darker) and light-colored choice cards.

  --------------------------------------------------

  Prompt 2:
  "How can i write conditional logic for a quiz app where the button turns green if correct
   and red if the user clicked the wrong one."

  Analysis and Application:
  - The AI provided a nested `if-else` structure using `selectionMade`, `isCorrect`,
    and `isSelected`.
  - This logic was integrated into the `build` method to handle real-time feedback
  --------------------------------------------------
  Prompt 3:
  "What variables should I define for a multi-question quiz with score tracking?"

  Analysis and Application:
  - The AI suggested defining:
      * currentQuestionIndex (int) to track the current question.
      * score (int) for cumulative points.
      * selectedIndex (int?) and selectionMade (bool) to manage
        interaction and feedback within each question.
      * _resetCounter (int) to force state reset via ValueKey.
  - These variables effectively manage the flow from answering
    to showing results and restarting.

  @author Duangkamon Chaithongsri
  @version 1.1.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
import '../models/choice.dart';
class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool isSelected;
  final bool selectionMade;
  final VoidCallback onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.selectionMade,
    required this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.choice.displayColor;
    if (widget.selectionMade) {
      if (widget.choice.isCorrect) {
        bgColor = Colors.green;
      } else if (widget.isSelected) {
        bgColor = Colors.red;
      }
    }
    final textColor = ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
        ? Colors.white
        : Colors.black;
    return GestureDetector(
      onTap: widget.selectionMade ? null : widget.onSelected,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Center(
          child: Text(widget.choice.name, style:  TextStyle(color: textColor )),
        ),
      ),
    );
  }
}