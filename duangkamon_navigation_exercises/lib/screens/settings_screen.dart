/*
  SettingsScreen (Lab 11 - User Preferences Management)

  This widget provides a comprehensive interface for managing user settings,
  utilizing the Provider pattern for real-time state synchronization.

  Application Core Analysis:
  - State Integration: Directly reads and writes to QuizPreferencesState using
    context.watch and context.read.
  - Component Variety: Implements SwitchListTile for toggles and RadioListTile
    for single-choice theme selection.
  - Interactive Dialogs: Features a private _showNameDialog method to handle
    text input for Name and Bio fields.

  --------------------------------------------------

  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt:
  "How to build a Settings screen that updates the app theme immediately?"

  Analysis and Application:
  - The AI suggested using 'RadioListTile<ThemeMode>' bound to the Provider.
    When 'onChanged' is triggered, it calls 'setThemeMode' which executes
    'notifyListeners()', causing the MaterialApp in the main file to
    rebuild with the new theme.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 1.1.0
  @date 2026-03-15
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/quiz_preferences_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Method ตาม documentation
  void _showNameDialog(BuildContext context, String field, String current) {
    final controller = TextEditingController(text: current);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit $field'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newValue = controller.text.trim();
              if (field == 'Name') {
                context.read<QuizPreferencesState>().setUserName(newValue);
              } else {
                context.read<QuizPreferencesState>().setUserBio(newValue);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<QuizPreferencesState>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text("User Profile", style: textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text("Name"),
              subtitle: Text(prefs.userName),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showNameDialog(context, 'Name', prefs.userName),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("Bio"),
              subtitle: Text(prefs.userBio),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showNameDialog(context, 'Bio', prefs.userBio),
            ),
            const Divider(),
            Text("Preferences", style: textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            SwitchListTile(
              secondary: const Icon(Icons.volume_up_outlined),
              title: const Text("Sound Effects"),
              subtitle: const Text("Play sounds when answering"),
              value: prefs.soundEnabled,
              onChanged: (val) => prefs.setSoundEnabled(val),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.vibration_outlined),
              title: const Text("Vibration"),
              subtitle: const Text("Vibrate on correct/wrong answers"),
              value: prefs.vibrationEnabled,
              onChanged: (val) => prefs.setVibrationEnabled(val),
            ),
            const Divider(),
            Text("Theme", style: textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            RadioListTile<ThemeMode>(
              title: const Text("System Default"),
              value: ThemeMode.system,
              groupValue: prefs.themeMode,
              onChanged: (val) => prefs.setThemeMode(val!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: prefs.themeMode,
              onChanged: (val) => prefs.setThemeMode(val!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: prefs.themeMode,
              onChanged: (val) => prefs.setThemeMode(val!),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        label: const Text("View Profile"),
        icon: const Icon(Icons.account_box_outlined),
      ),
    );
  }
}