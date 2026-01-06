/* The main entry point for the 'My Pet App' application.
   It initializes the Flutter framework via MaterialApp and disables the debug banner.
   The app launches the 'PetsScreen' as the home view, displaying a structured 2x2 grid gallery
   of pet profiles (Bird, Dog, Cat, Rabbit).
   This demonstrates the composition of custom widgets (PetCard) within a layout using Column and Row.

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-06
*/

import 'package:flutter/material.dart';
import '../screens/pet_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Pet App',
      debugShowCheckedModeBanner: false,
      home: const PetsScreen(),
    ),
  );
}
