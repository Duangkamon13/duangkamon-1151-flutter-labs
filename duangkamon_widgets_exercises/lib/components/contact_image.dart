/* A reusable widget that displays a circular profile image with a name tag overlaid.
   It utilizes a Stack widget to position the name label on top of the image
   at a specific coordinate using Alignment.

   AI Documentation
   AI Tool: Gemini 3 Pro

   Prompt 1: "What does alignment: const Alignment(0.2, 0.6) mean?"
   Prompt answer analysis and application:
   - The AI clarified that Alignment uses an (x, y) coordinate system relative to the center (0,0).
   - Values range from -1.0 to 1.0. The value (0.5, 0.6) means shifting right by 50% and down by 60%.
   - I used 'Alignment(0.5, 0.6)' to position the name tag slightly off-center towards the bottom-right, similar to the lab example.

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-14
*/

import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String imagePath;
  final String name;
  const ContactImage({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.5, 0.6),
      children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 140),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.black),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
