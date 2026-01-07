/* The main entry point for the 'My Contacts' application.
   It initializes the app with a Material 3 design, configuring a specific color scheme (Orange seed)
   that supports both Light and Dark modes based on the system setting.
   It loads the 'ContactListScreen' as the home page.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-07
*/

import 'package:flutter/material.dart';
import 'screens/contact_list_screen.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
            brightness: Brightness.dark
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ContactListScreen(),
    );
  }
}