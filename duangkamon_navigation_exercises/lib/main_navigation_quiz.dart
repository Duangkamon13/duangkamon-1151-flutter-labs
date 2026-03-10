/*
  QuizApp

  This is the entry point of the application. It acts as the "Parent" widget
  that manages the overall state, including the current question index,
  cumulative score, and answer persistence using a Map-based storage system.

  Concepts used (Based on Problem 1 Requirements):
  - State Lifting: All critical data (score, selections) are kept here and
    passed down to QuizScreen to ensure a Single Source of Truth.
  - Score Recalculation Logic: Handles score updates dynamically by
    subtracting previous correct answers before adding new ones.
  - ValueKey Strategy: Uses a 'resetCounter' as a Key to force a complete
    re-initialization of the QuizScreen when the user restarts.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Google)

  Prompt 1:
  "What methods should I add to manage a multi-question quiz efficiently?"

  Analysis and Application:
  - The AI suggested modularizing the logic into specific methods:
      _handleChoice(index): For score logic and saving answers to a Map.
      _showScoreDialog(): To provide final feedback via AlertDialog.
      _restartQuiz(): To clear all states and reset the index to 0.
  - This separation makes the code easier to maintain and debug.

  --------------------------------------------------
  Prompt 2:
  "How should I design the bottom navigation buttons for a simple quiz flow?"

  Analysis and Application:
  - The AI recommended using a BottomAppBar with a Row (spaceBetween).
  - Implementation:
       'Previous' button: Conditionally rendered only if index > 0.
       'Next' button: Stays as a simple ElevatedButton
        and performs two roles: moving to the next index or triggering
        the score dialog at the end.
  - This ensures a clean UI focus as requested, removing the "Finish" label.
  --------------------------------------------------
  Prompt 3:
  "How to handle users changing their minds without messing up the score?"
  Analysis and Application:
  - The AI provided a recalculation logic: Check if a 'previousChoiceIndex'
    exists for the current question; if that old choice was correct,
    decrement the score first, then evaluate the new choice.
  - This allows the 'Score Recalculation' to remain accurate even if
    a user taps multiple times on the same question.

  @author Duangkamon Chaithongsri
  @version 1.4.0
  @date 2026-03-10
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import 'package:duangkamon_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Quiz App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
        brightness: Brightness.dark,
      ),
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  int resetCounter = 0;

  final Map<int, int?> _selectedAnswers = {};
  final Map<int, bool> _questionAnswered = {};
  final List<Question> _questions = [
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/cnx.jpg",
      choices: [
        Choice(
          name: "Chiang Mai",
          isCorrect: true,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: "Khon Kaen",
          isCorrect: false,
          displayColor: Colors.orangeAccent,
        ),
        Choice(
          name: "Bangkok",
          isCorrect: false,
          displayColor: Colors.pinkAccent,
        ),
        Choice(
          name: "Phuket",
          isCorrect: false,
          displayColor: Colors.blueAccent,
        ),
      ],
    ),

    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/kku.jpg",
      choices: [
        Choice(
          name: "Chiang Mai",
          isCorrect: false,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: "Khon Kaen",
          isCorrect: true,
          displayColor: Colors.orangeAccent,
        ),
        Choice(
          name: "Bangkok",
          isCorrect: false,
          displayColor: Colors.pinkAccent,
        ),
        Choice(
          name: "Phuket",
          isCorrect: false,
          displayColor: Colors.blueAccent,
        ),

      ],
    ),

    Question(
      title: "Who is this picture of?",
      imagePath: "assets/images/shinchan.jpg",
      choices: [
        Choice(
          name: "Ann",
          isCorrect: false,
          displayColor: Colors.lightBlueAccent,
        ),
        Choice(
          name: "Anya",
          isCorrect: false,
          displayColor: Colors.indigoAccent,
        ),
        Choice(
          name: "Duangkamon",
          isCorrect: false,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: "Shinchan",
          isCorrect: true,
          displayColor: Colors.pinkAccent,
        ),
      ],
    ),
  ];

  void _handleChoice(int choiceIndex) {
    final question = _questions[currentQuestionIndex];
    final previousChoiceIndex = _selectedAnswers[currentQuestionIndex];
    setState(() {
      if (previousChoiceIndex != null &&
          question.choices[previousChoiceIndex].isCorrect) {
        score--;
      }
      if (question.choices[choiceIndex].isCorrect) {
        score++;
      }
      _selectedAnswers[currentQuestionIndex] = choiceIndex;
      _questionAnswered[currentQuestionIndex] = true;
    });
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Complete!"),
        content: Text("Your score: $score / ${_questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _restartQuiz();
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers.clear();
      _questionAnswered.clear();
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App by 663040115-1"),
      ),
      body: QuizScreen(
        key: ValueKey('quiz_$resetCounter'),
        question: _questions[currentQuestionIndex],
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
        isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
        onChoiceSelected: _handleChoice,
      ),

      // ai แนะนำทำเป็น bottom
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ปุ่ม Previous
              if (currentQuestionIndex > 0)
                ElevatedButton(
                  onPressed: () => setState(() => currentQuestionIndex--),
                  child: const Text("Previous"),
                )
              else
                const SizedBox.shrink(),
              //ปุ่ม next
              ElevatedButton(
                onPressed: () {
                  if (currentQuestionIndex < _questions.length - 1) {
                    setState(() => currentQuestionIndex++);
                  } else {
                    _showScoreDialog();
                  }
                },
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}