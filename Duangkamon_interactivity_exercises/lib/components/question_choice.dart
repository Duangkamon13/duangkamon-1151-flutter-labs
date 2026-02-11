/*
  QuestionChoice

  This widget represents a single selectable answer choice.
  It changes color after being tapped and displays a result dialog
  indicating whether the selected answer is correct.

  Concepts used:
  - StatefulWidget (to manage tap state)
  - setState for UI updates
  - Conditional rendering for color changes
  - GestureDetector for tap interaction
  - showDialog to display result feedback
  - Passing data to another widget via constructor

  Behavior:
  - Initially displays the provided background and foreground colors.
  - When tapped:
      * The state changes (isTapped = true).
      * The background turns green if correct, red if incorrect.
      * A ResultDialog is shown with the corresponding result.
  - Further taps are disabled after the first selection.

  --------------------------------------------------

  AI Documentation
  AI Tool: ChatGPT (GPT-5)

  Prompt 1:
  "What variables should I define for an answer choice widget?"

  Analysis and Application:
  - The AI suggested defining:
      * A String variable (name) for displaying the choice text.
      * Color variables (bgColor and fgColor) for styling.
      * A boolean variable (correct) to determine correctness.
      * A boolean state variable (isTapped) to track interaction.
  - These variables were implemented accordingly
    in the widget structure.

  --------------------------------------------------
  Prompt 2:
  "How can I change the button color after it is tapped?"

  Analysis and Application:
  - The AI suggested using a boolean state variable (isTapped).
  - setState() is used to update the UI.
  - Conditional logic determines the background color
    based on tap state and correctness.
  --------------------------------------------------

  Prompt 3:
  "How can I show a dialog indicating whether the selected answer is correct?"
  Analysis and Application:
  - The AI recommended using showDialog().
  - A separate ResultDialog widget is used
    to handle result display.
  - The correctness value (correct) is passed
    through the constructor.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/


import 'package:flutter/material.dart';
import 'result_dialog.dart';

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool correct;

  const QuestionChoice({
    super.key,
    required this.name,
    required this.bgColor,
    required this.fgColor,
    required this.correct,
  });

  @override
  State<QuestionChoice> createState() => _QuestionChoiceState();
}

class _QuestionChoiceState extends State<QuestionChoice> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    Color background;
    Color foreground;

    if (!isTapped) {
      background = widget.bgColor;
      foreground = widget.fgColor;
    } else {
      if (widget.correct) {
        background = Colors.green;
        foreground = Colors.white;
      } else {
        background = Colors.red;
        foreground = Colors.white;
      }
    }
    return GestureDetector(
        onTap: isTapped
            ? null
            : () {
          setState(() {
            isTapped = true;
          });
          showDialog(
            context: context,
            builder: (_) => ResultDialog( //เรียกใช้จาก widget
              isCorrect: widget.correct,
            ),
          );
      },
      child: Container(
        padding: const EdgeInsets.all(11.0),
        decoration: BoxDecoration(
          color: background,
        ),
        child: Center(
          child: Text(
            widget.name,
            style: TextStyle(
              color: foreground,
            ),
          ),
        ),
      ),
    );
  }
}

