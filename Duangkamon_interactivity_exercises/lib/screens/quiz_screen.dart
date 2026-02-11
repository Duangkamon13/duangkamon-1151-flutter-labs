/*
  QuizScreen

  This widget is responsible for displaying a single question, its associated image,
  and a grid of answer choices. It manages the UI layout and handles the user's
  interaction logic for that specific question before notifying the main app.

  Concepts used:
  - Layout Construction: Using Column, Expanded (flex), and GridView for responsive design.
  - State Management (Local): Tracking `selectedIndex` and `selectionMade` to control UI states.
  - Parent-Child Communication: Using `ValueChanged<bool>` to send answer results back to the parent.
  - Adaptive Design: Using a custom `Responsive` utility to adjust padding and grid ratios.

  Behavior:
  - Displays the Question Title (Text), Image (Asset), and Choices (Grid).
  - Uses `flex: 4` for the image and `flex: 5` for choices to balance the screen.
  - Prevents re-answering the same question by checking `selectionMade`.
  - Shows the "Next" button only after an answer has been selected.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini Pro

  Prompt 1:
  "How to pass data from a child widget (QuizScreen) back to the parent (QuizApp)?"
  Analysis and Application:
  - The AI explained the `Callback` pattern.
  - Defined `final ValueChanged<bool> onAnswer;` in the widget constructor.
  - Called `widget.onAnswer(isCorrect)` inside the `_handleChoiceSelected` method
    to update the score in the main app.

  --------------------------------------------------
  Prompt 2:
  "According to the document, I need to track selectedIndex (-1 if none) and selectionMade (bool),
   accept a Question object and a ValueChanged<bool> onAnswered callback.
   When a choice is tapped, call onAnswered(choice.isCorrect). How do I implement this?"
  Analysis and Application:
  - The AI broke down the requirements into implementation steps:
      1. Defined `final Question question` and `final ValueChanged<bool> onAnswer`
         in the StatefulWidget constructor to accept data.
      2. Declared `int? selectedIndex` (using null instead of -1 for Dart safety)
         and `bool selectionMade = false` inside the State class.
      3. Created the `_handleChoiceSelected` method to:
           - Check `if (selectionMade) return` (Guard clause).
           - Update state: `setState(() { selectedIndex = index; selectionMade = true; })`.
           - Trigger the callback: `widget.onAnswer(isCorrect)`.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
import '../models/question.dart';
import '../components/question_choice_card.dart';
import 'package:duangkamon_widgets_exercises/utils/responsive.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final ValueChanged<bool> onAnswer;
  final bool showNextButton;
  final VoidCallback onNext;

  const QuizScreen({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.showNextButton,
    required this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Set ค่าตาม Requiredment ของ Document
  int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (selectionMade) return;

    bool isCorrect = widget.question.choices[index].isCorrect;

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });
    widget.onAnswer(isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ Responsive utility ตามโค้ดเดิม เพราะ UI เหมือนเดิม
    bool isPortrait = Responsive.isPortrait(context);
    EdgeInsets screenPadding = Responsive.getScreenPadding(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: screenPadding,
      child: Column(
        children: [
          Center(
            child: Text(
              widget.question.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                widget.question.imagePath,
                fit: BoxFit.contain,
                
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              padding: EdgeInsets.all(isPortrait ? 20 : 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: isPortrait ? 2.5 : 8.0,
              ),

              itemCount: widget.question.choices.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: QuestionChoiceCard(
                      choice: widget.question.choices[index],
                      isSelected: selectedIndex == index,
                      selectionMade: selectionMade,
                      onSelected: () => _handleChoiceSelected(index),
                    ),
                  ),
                );
              },
            ),
          ),
          if (selectionMade && widget.showNextButton)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: widget.onNext,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 45),
                  elevation: 2,
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: const Text("Next"),
              ),
            ),
        ],
      ),
    );
  }
}