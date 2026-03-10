/*
  QuizScreen
  This widget displays an individual quiz question, including its title,
  an associated image, and a grid of interactive answer choices. It is
  designed to support seamless navigation between questions while
  maintaining the user's selection state.

  Concepts used:
  - State Lifting: Selection data is managed by the parent and passed down
    via 'initialSelectedIndex' to ensure data persistence.
  - Lifecycle Sync (didUpdateWidget): Automatically refreshes the local
    selection when the parent provides a new question or index.
  - Compositional Layout: Uses Column, Expanded, and Padding to create
    a balanced UI without relying on complex responsive utilities.
  - Grid Customization: Employs 'childAspectRatio' to control the size
    and shape of the choice buttons.

  Behavior:
  - On Load: Displays the question content and restores any previously
    selected answer using 'initState'.
  - On Navigation: Updates the UI immediately when 'Next' or 'Previous'
    is pressed by detecting widget changes in 'didUpdateWidget'.
  - On Selection: Updates the local highlight and notifies the parent
    to recalculate the score in real-time.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt 1:
  "How to make GridView choices smaller and not too bulky in a Column?"

  Analysis and Application:
  - The AI suggested using the 'childAspectRatio' property in the
    SliverGridDelegateWithFixedCrossAxisCount.
  - A value of 2.0 was applied to make the buttons shorter (rectangular)
    rather than square, preventing them from occupying too much vertical space.

  --------------------------------------------------
  Prompt 2:
  "How to add consistent margins to the entire screen content?"

  Analysis and Application:
  - The AI recommended wrapping the main Column with a 'Padding' widget.
  - 'EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0)' was used
    to create a balanced "gutter" around the content, improving readability.
  --------------------------------------------------

  Prompt 3:
  "Why is my GridView not showing or causing errors inside a Column?"

  Analysis and Application:
  - The AI identified that GridView inside a Column needs to be wrapped
    in an 'Expanded' widget
  - It also suggested using 'NeverScrollableScrollPhysics()' to prevent
    scroll conflicts between the GridView and the main screen layout.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-03-10
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final Question question;
  final int? initialSelectedIndex;
  final bool isInitiallyAnswered;
  final Function(int) onChoiceSelected;

  const QuizScreen({
    super.key,
    required this.question,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
    required this.onChoiceSelected,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }
//โค้ดตาม documentation
  @override
  void didUpdateWidget(covariant QuizScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.question != widget.question) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  void _handleChoiceSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onChoiceSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
          const SizedBox(height: 25),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                widget.question.imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            flex: 5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.0,
              ),
              itemCount: widget.question.choices.length,
              itemBuilder: (context, index) {
                return QuestionChoiceCard(
                  choiceText: widget.question.choices[index].name,
                  defaultColor: widget.question.choices[index].displayColor,
                  isSelected: selectedIndex == index,
                  onTap: () => _handleChoiceSelected(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}