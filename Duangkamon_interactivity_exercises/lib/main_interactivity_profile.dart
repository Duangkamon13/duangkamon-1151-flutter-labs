
/*
  main.dart

  This file is the entry point of the Flutter application.
  Responsibilities:
  1. Initialize and launch the app.
  2. Configure global application themes.
  3. Enable Material Design 3.
  4. Support automatic Light and Dark mode switching.
  5. Define the default home screen.

  AI Documentation
  AI Tool: I don't use any ai tools

*/


import 'package:flutter/material.dart';
import 'screens/profile_card_rating_responsive.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple , brightness: Brightness.dark)
      ),
      home: const ProfileCardRatingResponsive(),
    );
  }
}
