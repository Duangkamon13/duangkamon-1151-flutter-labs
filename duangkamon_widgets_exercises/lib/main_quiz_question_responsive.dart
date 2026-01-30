/* Main Quiz Application
   The entry point for the responsive quiz application. Sets up the theme
   and loads the main question screen and support dark and light modes.

   AI Documentation
   I don't use any AI tool

@author Duangkamon Chaithongsri
@version 1.0.0
@date 2025-01-30
*/

import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'components/question_choices_responsive.dart';
//โค้ดเดิมจาก version ก่อนหน้า
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
        appBar: AppBar(
          title: const Text('Quiz App by 663040115-1'),
          centerTitle: true,
        ),
        // เพิ่มการใช้ Safe area เข้าไป
        body: const SafeArea(
          child: QuestionWithChoicesResponsive(
            title: 'Where is this picture?',
            imagePath: 'assets/images/kku.jpg',
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
          ),
        ),
      ),
    );
  }
}