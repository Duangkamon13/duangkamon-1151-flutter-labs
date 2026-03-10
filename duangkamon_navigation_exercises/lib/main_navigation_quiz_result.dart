/*
  Main Navigation Quiz Result (Problem 3 - Application Analysis)

  This application represents the final stage of the Quiz App development.
  It transitions from a simple single-page state manager to a robust,
  multi-screen navigation system using Named Routes and a 'Deferred Feedback'
  architecture.

  Application Core Analysis:
  - Navigation Flow: Cover Page (Entry) -> Quiz Screen (Input) -> Results Screen (Feedback).
  - State Management: Centralized 'Lifting State Up' in QuizApp allows for
    real-time score tracking and persistent answer mapping.
  - User Experience: Implements a clean UI where correct/incorrect answers are
    deferred until the final review, promoting learning without immediate pressure.
  - Reset Capability: A complete application reset via ValueKey ensuring all
    widget states are purged upon restart.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt 1:
  "Can I reuse my existing methods from Problems 1 & 2 for this final version?
   What needs to be added or modified?"

  Analysis and Application:
  - Yes! The "Core Logic" methods like '_handleChoice' are reused because
    the scoring rules remain the same.
  - What's New: You must add '_handleRestart' to handle the transition back
    to the root and increment 'resetCounter'.
  - Modification: The 'goToNext' logic must be updated. Instead of showing
    a dialog at the final index, it now performs a Navigator.push to the
    QuizResultScreen, passing the current session data as arguments.

  --------------------------------------------------

  Prompt 2:
  "How to properly implement the 'Restart' flow back to the cover page?"

  Analysis and Application:
  - The AI suggested a two-step navigation in '_handleRestart':
    1. Navigator.pop(context) to close the ResultsScreen.
    2. Navigator.pushNamed(context, '/') to return to the welcome screen.
  - All state variables (score, index, maps) are cleared within the same
    setState call to ensure a fresh UI for the next attempt.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-03-10
*/


//โค้ดจากแลปก่อน
import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';
import 'package:duangkamon_interactivity_exercises/models/choice.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/quiz_result_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(
          title: "Quiz App Duangkamon",
          author: "Duangkamon Chaithongsri",
          studentId: "663040115-1",
        ),
        '/quiz': (context) => const QuizApp(),
      },
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
      appBar: AppBar(title: const Text("Quiz App by 663040115-1")),
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