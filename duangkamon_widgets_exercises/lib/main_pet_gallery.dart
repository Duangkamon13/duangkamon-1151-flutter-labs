import 'package:flutter/material.dart';
import 'package:duangkamon_widgets_exercises/screens/pet_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Pet App',
      debugShowCheckedModeBanner: false,
      home: const PetsScreen(),
    ),
  );
}
