/* Faculty Detail Screen
   Displays detailed information (Description , thainame and image ) about a selected faculty.

   AI Documentation
   AI Tool: Gemini 3 Pro

   Prompt: "What command should I use to declare a variable for accessing the primary theme color?"
   Prompt answer analysis and application:
   - The AI explained that to access the theme's colors dynamically, we should retrieve the ColorScheme from the current context.
   - It recommended declaring 'final ColorScheme colorScheme = Theme.of(context).colorScheme;' at the top of the build method.
   - I applied this variable to set the Container's background to 'colorScheme.primary' and text to 'colorScheme.onPrimary', ensuring it matches the app's theme.

   VERIFICATION:
   - Tested by switching themes; the colors updated correctly based on the declared colorScheme.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/


import 'package:flutter/material.dart';
import '../models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  final FacultyModel faculty;
  const FacultyDetail({super.key, required this.faculty});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(faculty.name), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              faculty.description,
              style: TextStyle(color: colorScheme.onPrimary),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Text(
              faculty.thaiName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              faculty.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
