/*
  APP OVERVIEW: Problem 1 - Profile Card with Submit Button and AlertDialog
  This app is a Flutter app that displays a profile card with student
  info and a confirmation dialog, supporting MD3 Light/Dark themes.

  LEARNING OBJECTIVES ACHIEVED:
  1. Interactive ElevatedButton: Styled using Material 3 semantic colors.
  2. AlertDialog Implementation: Used showDialog() to handle user confirmation with
     OK/Cancel actions.
  3. MD3 Theming: Implemented both Light and Dark theme support using ColorScheme.fromSeed.
  4. Component-Based Architecture: Created reusable widgets (ProfileScreen,
     ProfileWithButton, Submitbutton).

  AI Documentation
  AI Tool: I don't use any ai tool.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-04

*/

import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainProfileButton(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
class MainProfileButton extends StatelessWidget {
  const MainProfileButton({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      name: "Duangkamon",
      id: "663040115-1",
      imagePath: "assets/images/profile.JPG",
      photoCredit: "EN Photo",
    );
  }
}
