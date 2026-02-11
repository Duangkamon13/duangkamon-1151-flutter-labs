/*
  QuizApp (Main Entry Point)

  The entry point and state manager for the multi-question quiz application.
  It handles the overall game logic, including score tracking, question navigation,
  theme management (Light/Dark mode), and resetting the game state.

  Concepts used:
  - Material App & Theming: Setting up global themes using `ColorScheme.fromSeed`
    to support both light and dark modes.
  - State Lifting: Managing `score` and `currentQuestionIndex` at the top level
    to share data across screens.
  - Keyed Subtrees (ValueKey): Forcing the `QuizScreen` to rebuild completely
    when navigating or restarting.
  - Dialogs: Displaying the final score and restart option using `AlertDialog`.

  Behavior:
  - Initializes the app with a Deep Purple seed color theme.
  - Tracks the user's progress through the `questions` list.
  - Updates the score when `onAnswer` is triggered by the child widget.
  - Displays a summary dialog when all questions are answered.
  - Resets all variables and increments `_resetCounter` to restart the quiz cleanly.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini Pro

  --------------------------------------------------

  Prompt 1:
  "How to reset the state of a child widget (QuizScreen) when restarting the quiz?"

  Analysis and Application:
  - The AI suggested using a `Key`, specifically `ValueKey`.
  - By passing `key: ValueKey('${currentQuestionIndex}_$_resetCounter')`,
    Flutter treats the widget as "new" whenever the index or reset counter changes.
  - This automatically clears the `selectedIndex` and local state inside `QuizScreen`
    without complex manual reset logic.

  --------------------------------------------------

  Prompt 2:
  "How do I manage the quiz flow (Next Question / Show Result) in the parent widget?"

  Analysis and Application:
  - The AI advised creating a `_handleNext` function.
  - Logic: Check if `currentQuestionIndex < length - 1`.
    If yes, increment index. If no, call `_showResultDialog`.
  - This keeps the navigation logic separate from the UI rendering.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
import 'models/question.dart';
import 'models/choice.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const QuizApp(),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool questionAnswered = false;
  int _resetCounter = 0;

  final List<Question> questions = [
    Question(
      title: "Where is this picture?",
      imagePath: "assets/images/cnx.jpg",
      choices: [
        Choice(
          name: "Chaing Mai",
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
  ];

  void _handleAnswer(bool isCorrect) {
    setState(() {
      if (isCorrect) score++;
      questionAnswered = true;
    });
  }

  void _handleNext() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionAnswered = false;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Complete!"),
        content: Text(
          "Your score:$score/${questions.length}",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                questionAnswered = false;
                _resetCounter++;
              });
            },
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App By 663040115-1")),
      body: QuizScreen(
        key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
        question: questions[currentQuestionIndex],
        onAnswer: _handleAnswer,
        showNextButton: questionAnswered,
        onNext: _handleNext,
      ),
    );
  }
}
