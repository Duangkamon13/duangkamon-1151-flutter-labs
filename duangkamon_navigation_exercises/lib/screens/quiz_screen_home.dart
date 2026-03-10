/*
  QuizScreenHome

  This widget manages the individual question display with an integrated
  navigation bar. It maintains a stable UI by ensuring that the 'Home'
  button remains perfectly centered, even when 'Previous' or 'Next'
  buttons are hidden.

  Concepts used (Problem 2):
  - Visibility Widget Control: Utilizing 'maintainSize: true' to preserve
    the layout space of hidden buttons, preventing the Home button from shifting.
  - State Syncing (didUpdateWidget): Keeping 'currentSelection' in sync
    with the parent's data during navigation transitions.
  - Navigation Stack (popUntil): Using 'route.isFirst' to provide a
    one-tap shortcut back to the Cover Page.
  - Custom Parameter Naming: Using specific variable names (activeQuestion,
    notifySelection, goToNext) to differentiate the navigation logic from
    standard Problem 1 patterns.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt 1:
  "How to keep the Home button centered regardless of button visibility?"

  Analysis and Application:
  - The AI suggested wrapping the Previous and Next buttons in 'Visibility'
    widgets with 'maintainSize', 'maintainAnimation', and 'maintainState'
    set to true.
  - This preserves the reserved space for these buttons, ensuring the
    'MainAxisAlignment.spaceBetween' in the Row keeps the Home button
    at the geometric center of the screen.

  --------------------------------------------------
  Prompt 2:
  "What is the difference between this and Problem 1 besides the Home button?"

  Analysis and Application:
  - The AI highlighted two major architectural shifts:
      1. UI Stability: Problem 1 used conditional rendering (if-else)
         which caused buttons to jump. Problem 2 uses Visibility for
         constant positioning.
      2. Navigation Flow: This widget utilizes Named Routes logic, where
         the Home button can clear the entire stack using popUntil.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-03-10
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreenHome extends StatefulWidget {
  final Question activeQuestion;
  final int? initialSelectedIndex;
  final Function(int) notifySelection;
  final VoidCallback goToNext;
  final VoidCallback goToPrev;
  final bool isPrevVisible;
  final bool isNextVisible;

  const QuizScreenHome({
    super.key,
    required this.activeQuestion,
    required this.initialSelectedIndex,
    required this.notifySelection,
    required this.goToNext,
    required this.goToPrev,
    required this.isPrevVisible,
    required this.isNextVisible,
  });

  @override
  State<QuizScreenHome> createState() => _QuizScreenHomeState();
}

class _QuizScreenHomeState extends State<QuizScreenHome> {
  int? currentSelection;

  @override
  void initState() {
    super.initState();
    currentSelection = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreenHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.activeQuestion != widget.activeQuestion) {
      setState(() {
        currentSelection = widget.initialSelectedIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            widget.activeQuestion.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          Expanded(
            flex: 4,
            child: Image.asset(widget.activeQuestion.imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 40),
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: widget.activeQuestion.choices.length,
              itemBuilder: (context, index) {
                final option = widget.activeQuestion.choices[index];
                return QuestionChoiceCard(
                  choiceText: option.name,
                  defaultColor: option.displayColor,
                  isSelected: currentSelection == index,
                  onTap: () {
                    setState(() => currentSelection = index);
                    widget.notifySelection(index);
                  },
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: widget.isPrevVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: widget.goToPrev,
                  child: const Text("Previous"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Home"),
              ),
              Visibility(
                visible: widget.isNextVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: widget.goToNext,
                  child: const Text("Next"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}