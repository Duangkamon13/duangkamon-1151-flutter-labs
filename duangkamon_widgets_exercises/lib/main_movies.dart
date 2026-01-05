import 'package:flutter/material.dart';
import 'package:duangkamon_widgets_exercises/models/movie_model.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Colors.black,
        //   foregroundColor: Colors.white,
        // ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MovieListEx(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MovieListEx extends StatelessWidget {
  const MovieListEx({super.key});

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
      appBar: AppBar(title: const Text("Movie List")),


    );
  }
}
