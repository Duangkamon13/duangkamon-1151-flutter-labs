import 'package:flutter/material.dart';

class Movie {
  final String title;
  final int year;
  final String genre;
  final String director;
  final double rating;

  const Movie ({
    required this.title,
    required this.director,
    required this.genre,
    required this.rating,
    required this.year,
  });
}