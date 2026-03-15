/*
  Main Preferences Quiz

  This application extends Lab 10 by integrating the 'Provider' package for
  global state management. It allows user preferences like 'UserName' and
  'ThemeMode' to persist and be accessible across all screens.

  Key Implementations:
  - Global State: Utilizes ChangeNotifierProvider to wrap the entire app
  - Reactive UI: The MaterialApp's themeMode is now driven by the Provider state
    instead of being hardcoded
  - Settings Integration: Added a gear icon in the Quiz AppBar to navigate
    to a new user preferences system

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt:
  "Can I reuse my existing methods? Do I need to add new ones?"

  Analysis and Application:
  - Method Reuse: You can reuse '_handleChoice' and '_questions' as the core
    quiz gameplay remains unchanged
  - New Methods: You must implement '_handleRestart' to reset internal state
    and increment 'resetCounter', and integrate navigation to '/settings'
    using named routes

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 4.0.0
  @date 2026-03-15
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import 'package:duangkamon_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/quiz_result_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'screens/quiz_result_screen.dart';
import 'states/quiz_preferences_state.dart';


//โค้ดจาก documentation + โค้ดเดิม
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizPreferencesState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    return MaterialApp(
      initialRoute: '/',
      themeMode: prefs.themeMode,
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
      routes: {
        '/': (context) => const QuizCoverPage(
          title: "Quiz App Duangkamon",
          author: "Duangkamon Chaithongsri",
          studentId: "663040115-1",
        ),
        '/quiz': (context) => const QuizApp(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class QuizCoverPage extends StatelessWidget {
  final String title;
  final String author;
  final String studentId;

  const QuizCoverPage({
    super.key,
    required this.title,
    required this.author,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined, size: 120, color: colorScheme.primary),
            const SizedBox(height: 20),
            Text("Welcome to $title", style: Theme
                .of(context)
                .textTheme
                .headlineSmall),
            Text("By $author $studentId"),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/quiz'),
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
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
          question.choices[previousChoiceIndex].isCorrect) score--;
      if (question.choices[choiceIndex].isCorrect) score++;
      _selectedAnswers[currentQuestionIndex] = choiceIndex;
    });
  }

  void _handleRestart() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers.clear();
      resetCounter++;
    });
    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App by 663040115-1"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
      body: QuizScreenHome(
        key: ValueKey('quiz_$resetCounter'),
        activeQuestion: _questions[currentQuestionIndex],
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
        notifySelection: _handleChoice,
        isPrevVisible: currentQuestionIndex > 0,
        isNextVisible: true,
        goToPrev: () => setState(() => currentQuestionIndex--),
        goToNext: () {
          if (currentQuestionIndex < _questions.length - 1) {
            setState(() => currentQuestionIndex++);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizResultScreen(
                  questions: _questions,
                  selectedAnswers: _selectedAnswers,
                  totalScore: score,
                  onRestart: _handleRestart,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}