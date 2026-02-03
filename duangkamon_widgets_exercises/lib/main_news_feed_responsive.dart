/* The entry point of the Responsive News Feed application.
   This file contains the 'NewsFeedApp' class which sets up the MaterialApp,
   defines the global Theme (Material 3), and provides sample data.

   How to Run:
   - The 'main()' function calls 'runApp(const NewsFeedApp())' to start the app.
   - It acts as the Root Widget that injects data into the 'NewsFeedScreen'.

  AI Documentation
  AI Tool: Gemini 3 Flash
  Prompt 1: "How should I call the NewsFeedApp in the main function?"
  Prompt answer analysis and application:
  - The AI explained that 'runApp()' is the standard way to attach the root widget
    to the screen.
  - I applied this by wrapping 'NewsFeedApp' inside 'runApp()' within the 'main()'
    entry point.

  Prompt 2: "Why is the sample data (articles) placed inside the build method?"
  Prompt answer analysis and application:
  - The AI suggested that for small Lab projects, keeping data near the point of
    injection is convenient.
  - I placed the 'articles' list inside the 'build' method of 'NewsFeedApp'
    so it can be directly passed to the 'home' property of MaterialApp.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-03
*/

import 'package:flutter/material.dart';
import 'models/article_model.dart';
import 'screens/news_feed_screen.dart';

void main() {
  runApp(const NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  const NewsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    //โค้ด Sample จากอาจารย์
    final List<Article> articles = const [
      Article(
        title: 'Introduction to Flutter',
        description: 'Learn the basics of Flutter development...',
        date: '2024-01-05',
        readingTimeMinutes: 5,
      ),
      Article(
        title: 'Advanced Widget Patterns',
        description: 'Discover advanced patterns in Flutter...',
        date: '2024-01-04',
        readingTimeMinutes: 8,
      ),
      Article(
        title: 'State Management in Flutter',
        description: 'Explore different state management approaches...',
        date: '2024-01-03',
        readingTimeMinutes: 12,
      ),
      Article(
        title: 'Building Responsive UIs',
        description: 'Create apps that work on any screen size...',
        date: '2024-01-02',
        readingTimeMinutes: 10,
      ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News Feed App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: NewsFeedScreen(articles: articles),
    );
  }
}