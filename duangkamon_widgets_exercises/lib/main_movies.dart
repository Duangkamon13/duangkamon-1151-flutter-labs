/* The main entry point for the 'Movie List' application.
   It displays a list of movies with details (Title, Year, Genre, Director).
   Key Features:
   1. Dynamic Styling: The Star icon and Rating text change color based on the score.
      - High rating (>= 7.0): Uses the Theme's primary color (Pink).
      - Low rating (< 7.0): Uses the default variant color (Grey/Black).
   2. Interactive Feedback: Tapping a movie item triggers a SnackBar with a specific message based on the rating range.

  AI Documentation
  AI Tool: Gemini 3 Pro

  Prompt 1: "How can I handle the tap event to show different messages based on the rating?"
  Prompt answer analysis and application:
  - The AI recommended inserting the if-else logic directly into the existing function ('_handleMovieTap').
  - This logic checks if the rating is > 8.0, between 6.0-8.0, or below 6.0 to set the appropriate message.
  - I applied this logic to display a customized SnackBar when a movie is tapped.

  Prompt 2: "How can I change the color of the icon and text based on the rating score?"
  Prompt answer analysis and application:
  - The AI recommended accessing the current theme colors using 'Theme.of(context).colorScheme'.
  - It provided a logic snippet using a ternary operator:
    'final Color itemsColor = isHighRated ? colorScheme.primary : colorScheme.onSurfaceVariant;'
  - I integrated this code to highlight high-rated movies (>= 7.0) with the primary color, while others remain standard.

  VERIFICATION:
  - The app correctly displays a list of 3 movies.
  - Movies with a rating >= 7.0 (Shawshank, Inception) show stars and scores in the primary color .
  - Movies with low rating (Disaster Movie) show standard colors.
  - Tapping each movie triggers the correct SnackBar message.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-07
*/

import 'package:flutter/material.dart';
import '../models/movie_model.dart';

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
      home: const MovieListEx(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MovieListEx extends StatelessWidget {
  const MovieListEx({super.key});

  void _handleMovieTap(BuildContext context, Movie movie) {
    String message;
    if (movie.rating > 8.0) {
      message = "This is a highly rated movie!";
    } else if (movie.rating >= 6.0 && movie.rating <= 8.0) {
      message = "This is a good movie";
    } else {
      message = "This movie might need improvement";
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Movie> movies = [
      const Movie(
        title: "The Shawshank Redemption",
        year: 1994,
        genre: "Drama",
        director: "Frank Darabont",
        rating: 9.3,
      ),
      const Movie(
        title: "Inception",
        year: 2010,
        genre: "Sci-Fi",
        director: "Christopher Nolan",
        rating: 7.8,
      ),
      const Movie(
        title: "Disaster Movie",
        year: 2008,
        genre: "Comedy",
        director: "Jason Friedberg",
        rating: 1.9,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: movies.map((movie)
        {
          final colorScheme = Theme.of(context).colorScheme;
          final bool isHighRated = movie.rating >= 7.0;
          final Color itemsColor = isHighRated
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant;

          return ListTile(
            leading: Icon(Icons.movie, color: colorScheme.primary),
            title: Text(
              movie.title,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "${movie.year} • ${movie.genre}\nDirector: ${movie.director}",
              style: TextStyle(color: colorScheme.secondary),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: itemsColor),
                Text(
                  movie.rating.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: itemsColor,
                  ),
                ),
              ],
            ),
            onTap: () => _handleMovieTap(context, movie),
          );
        }).toList(),
      ),
    );
  }
}
