/*
  ProfileScreen

  This screen displays a read-only view of the user's profile and preferences.
  It demonstrates how to retrieve and format global state data for presentation.

  Application Core Analysis:
  - Data Access: Consumes QuizPreferencesState using context.watch for
    real-time updates.
  - UI Layout: Uses a Column-based layout with a custom Avatar, descriptive
    text styles, and stylized status indicators.
  - Interaction: Provides a simple Navigator.pop() function to return to
    the Settings screen.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt:
  "How to build a profile screen with a circular avatar and stylized boxes
   for preferences?"

  Analysis and Application:
  - The AI suggested using 'CircleAvatar' for the profile initial and
    'OutlinedContainer' (using Row and Container) for the Sound and
    Vibration status boxes to match the UI reference.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-03-15
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  prefs.userName.isNotEmpty ? prefs.userName[0].toUpperCase() : '?',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                prefs.userName,
                style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                prefs.userBio,
                style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatusBox(
                    context,
                    prefs.soundEnabled ? Icons.volume_up : Icons.volume_off,
                    prefs.soundEnabled ? "Sound On" : "Sound Off",
                  ),
                  const SizedBox(width: 16),
                  _buildStatusBox(
                    context,
                    prefs.vibrationEnabled ? Icons.smartphone : Icons.phonelink_erase,
                    prefs.vibrationEnabled ? "Vibration On" : "Vibration Off",
                  ),
                ],
              ),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.settings),
                label: const Text("Edit Settings"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: const StadiumBorder(),
                  backgroundColor: colorScheme.surfaceVariant.withOpacity(0.5),
                  foregroundColor: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildStatusBox(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color:colorScheme.onPrimaryContainer),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}