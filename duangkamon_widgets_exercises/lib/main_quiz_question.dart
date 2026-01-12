/* The main entry point for the 'Quiz App'.
   It sets up the Material App structure, configures Light/Dark themes using a deep purple seed color,
   and initializes the quiz with a specific question regarding a university.

   Key Features:
   - Supports System Theme Mode (Auto Light/Dark).
   - Passes data (Question, Choices, Image) to the 'QuestionWithChoices' widget.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-12
*/

import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'components/question_with_choices.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        appBar: AppBar(title: const Text('Quiz App by 663040115-1')),
        body: const QuestionWithChoices(
          title: 'Where is this picture?',
          choices: [
            QuestionChoice(
              name: 'Chiang Mai University',
              bgColor: Colors.purpleAccent,
            ),
            QuestionChoice(
              name: 'Khon Kaen University',
              bgColor: Colors.orangeAccent,
            ),
            QuestionChoice(
              name: 'Chulalongkorn University',
              bgColor: Colors.pinkAccent,
            ),
            QuestionChoice(
              name: 'Mahidol University',
              bgColor: Colors.blueAccent,
            ),
          ],
          imagePath: 'assets/images/kku.jpg',
        ),
      ),
    );
  }
}
