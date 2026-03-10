/*
  Main Navigation Quiz Cover

  This file serves as the updated entry point for Problem 2, implementing
  a Named Route system to manage transitions between the Cover Page
  and the Quiz Application.

  Concepts used:
  - Named Routes: Mapping string paths ('/', '/quiz') to specific widgets.
  - initialRoute: Ensuring the application lifecycle starts at the Cover Page.
  - Navigator.pushNamed: Decoupling screen transitions from hardcoded classes.
  - Material 3 Seed Color: Centralizing the theme using Colors.orange.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt 1:
  "How to implement '/' and '/quiz' routes so the app always starts
   at the cover page?"

  Analysis and Application:
  - The AI suggested defining the 'routes' Map in MaterialApp.
  - The 'initialRoute' property was set to '/' to force QuizCoverPage as
    the starting point, while '/quiz' points to the QuizApp manager.
  - This allows for cleaner navigation logic using Navigator.pushNamed.

  --------------------------------------------------

  Prompt 2:
   "Can I reuse the methods from Problem 1 for the new navigation structure?
   What needs to be added or changed?"

  Analysis and Application:
  - The AI confirmed that core logic methods like _handleChoice, _showScoreDialog,
    and _restartQuiz are fully reusable because the underlying data (Questions/Score)
    remains the same.
  - However, new "Navigation Parameters" must be passed to the updated
    QuizScreenHome:
      * isPrevVisible & isNextVisible: To control the Visibility widgets.
      * goToPrev & goToNext: To handle index changes from within the screen.
  - The 'Restart' logic in the dialog was also slightly modified to stay consistent
    with the current state management without needing to push new routes.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-03-10
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import 'package:duangkamon_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App Problem 2',
      themeMode: ThemeMode.system,
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
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(
          title: "Quiz App Duangkamon",
          author: "Duangkamon Chaithongsri",
          studentId: "663040115-1",
        ),
        '/quiz': (context) => QuizApp(),
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
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz_outlined, size: 120, color: colorScheme.primary),
            const SizedBox(height: 20),
            Text(
              "Welcome to $title",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Text(
              "By $author $studentId",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
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
          question.choices[previousChoiceIndex].isCorrect)
        score--;
      if (question.choices[choiceIndex].isCorrect) score++;
      _selectedAnswers[currentQuestionIndex] = choiceIndex;
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
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                _selectedAnswers.clear();
              });
            },
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz App by 663040115-1")),
      body: QuizScreenHome(
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
            _showScoreDialog();
          }
        },
      ),
    );
  }
}
