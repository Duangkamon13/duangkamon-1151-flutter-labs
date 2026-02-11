/*
  MainApp (Quiz Application Entry)

  This widget initializes the Quiz application and configures
  global theming and the main question screen.

  Concepts used:
  - MaterialApp configuration
  - Material 3 ColorScheme.fromSeed
  - Light/Dark theme support (ThemeMode.system)
  - Passing parameters to reusable widgets
  - Widget composition (Stateless + Stateful widgets)

  Documentation
  AI Documentation: I don't use any AI tools for coding

  This implementation is based on previously written code
  from earlier lab exercises. The original application structure,
  theme configuration, and responsive layout were reused.

  Modification:
  - The overall layout structure remains unchanged.
  - Only the QuestionChoice parameters were updated
    to include additional properties such as:
      • fgColor
      • correct (boolean for answer validation)
  - These new parameters enable interactive answer checking
    without altering the original layout architecture.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'screens/question_with_choices.dart';

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
      home: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final colorScheme = Theme.of(context).colorScheme;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Quiz App by 663040115-1'),
            centerTitle: true,
          ),

          body: SafeArea(
            child: QuestionWithChoicesResponsive(
              title: 'Where is this picture?',
              imagePath: 'assets/images/kku.jpg',
              choices: [
                QuestionChoice(
                  name: 'Chiang Mai University',
                  bgColor: Colors.purpleAccent,
                  fgColor: colorScheme.onSecondary,
                  correct: false,
                ),
                QuestionChoice(
                  name: 'Khon Kaen University',
                  bgColor: Colors.orangeAccent,
                  fgColor: colorScheme.onSecondary,
                  correct: true,
                ),
                QuestionChoice(
                  name: 'Chulalongkorn University',
                  bgColor: Colors.pinkAccent,
                  fgColor: colorScheme.onSecondary,
                  correct: false,
                ),
                QuestionChoice(
                  name: 'Mahidol University',
                  bgColor: Colors.blueAccent,
                  fgColor: colorScheme.onSecondary,
                  correct: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
