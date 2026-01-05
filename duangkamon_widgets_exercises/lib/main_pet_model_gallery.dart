/* The entry point for the Pet Model Gallery application.
   It configures the root widget 'MaterialApp', disables the debug banner,
   and sets 'PetsGalleryScreen' as the home screen.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-05
 */

import 'package:flutter/material.dart';
import 'package:duangkamon_widgets_exercises/screens/pets_gallery_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Pets Model Gallery',
      debugShowCheckedModeBanner: false,
        home: const PetsGalleryScreen(),
    ),
  );
}
