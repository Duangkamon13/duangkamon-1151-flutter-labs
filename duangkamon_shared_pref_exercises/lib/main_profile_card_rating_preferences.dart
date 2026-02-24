/*
  Main Application Entry Point
  This file initializes the application, sets up the SharedPreferences cache,
  and defines the global Material 3 theme (Light & Dark modes).

  Concepts used:
  - Asynchronous initialization in main()
  - SharedPreferencesWithCache and allowList configuration
  - Dependency Injection (passing the prefs instance to the root widget)
  - Material 3 ColorScheme (Light and Dark theming)

  AI Documentation
  AI Tool: Gemini Pro

  Prompt:
  "How to properly initialize SharedPreferencesWithCache before runApp
   and restrict keys using allowList in Flutter?"

  Analysis and Application:
  - I already had the basic MaterialApp setup with light and dark themes.
  - I used the AI to understand the required setup for the new SharedPreferences API.
  - The AI explained that `WidgetsFlutterBinding.ensureInitialized()` must be
    called before running async native code in `main()`.
  - The AI also suggested using an `allowList` to explicitly state which keys
    ('profileRating') should be cached in memory for synchronous access.
  - I applied this by creating the instance in `main()` and passing it down
    via constructor injection to `MyApp`.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-24
*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/profile_card_rating_responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {'profileRating'},
    ),
  );
  runApp(MyApp(prefs: prefs));
}
class MyApp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;
  const MyApp({super.key, required this.prefs});
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
      home: Scaffold(
        body: Center(
          child: ProfileCardRatingResponsive(prefs: prefs),
        ),
      ),
    );
  }
}