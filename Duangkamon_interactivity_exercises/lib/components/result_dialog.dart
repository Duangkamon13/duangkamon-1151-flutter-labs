/*
  ResultDialog

  This widget displays a result dialog after a user selects
  an answer choice. It shows whether the answer is correct
  and displays the corresponding score.

  Concepts used:
  - StatelessWidget
  - Conditional (ternary) operator
  - AlertDialog
  - Navigator.pop for closing dialog
  - Passing data via constructor (isCorrect)

  AI Documentation
  AI Tool: ChatGPT (GPT-5)

  Prompt:
  "How can I pass a boolean value to AlertDialog
   to display different text based on correctness?"

  Analysis and Application:
  - The AI explained that a boolean parameter (isCorrect)
    can be passed through the constructor.
  - Conditional rendering using the ternary operator
    determines the title and content text.
  - The dialog itself remains stateless because
    it only displays data and does not manage state.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final bool isCorrect;
  const ResultDialog({super.key, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isCorrect ? "Correct!" : "Incorrect"),
      content: Text(
        isCorrect ? "Your score is 1" : "Your score is 0",
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
