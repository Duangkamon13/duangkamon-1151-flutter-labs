
/* A reusable Stateless Widget 'PetCard' that displays a pet image and name.
   It follows specific design requirements: 120x120px dimensions, rounded corners (radius 16),
   pink accent background for the label, and positional parameters for data input.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt 1: "What is wrong with 'const PetCard({required this.name...})'? Why doesn't it match the requirement?"
  Prompt answer analysis and application:
  - The AI explained the distinction between 'Named Parameters' (wrapped in {}) and 'Positional Parameters'.
  - Since the requirement specified 'positional parameters', the AI instructed removing the curly braces {} and the 'required' keyword from the constructor.
  - I applied this change to define the constructor as 'const PetCard(this.name, this.imgURL, {super.key});'.

  Prompt 2: "Is the layout and styling correct now? (Checking padding and radius)"
  Prompt answer analysis and application:
  - The AI pointed out that 'padding: EdgeInsets.all(8.0)' was incorrectly placed on the parent Container, which shrank the whole widget instead of padding the text.
  - It suggested moving the padding inside the bottom Container (the pink label) to correctly space the text.
  - It also verified that the border radius was updated to 16.0 and the font weight to w600 as per the strict specifications.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-06
*/

import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imgURL;
  const PetCard(this.name, this.imgURL, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            child: Image.network(
              imgURL,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
            child: Container(
              alignment: Alignment.center,
              color: Colors.pinkAccent,
              width: 120,
              child: Text(
                '$name',
                style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
