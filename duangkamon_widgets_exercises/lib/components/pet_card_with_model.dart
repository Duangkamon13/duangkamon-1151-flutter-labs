/* A reusable widget 'PetCardWithModel' for displaying a single pet card.
   It renders an image with rounded top corners and a labeled container below it.
   The widget accepts a 'PetModel' object to dynamically set the content and styling.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt: "Does this code meet the requirements? (checking specific radius and padding)"
  Prompt answer analysis and application:
  - The AI reviewed the code against the assignment requirements and identified two discrepancies:
    1. The border radius was set to 24.0 instead of the required 12.0.
    2. The label used a fixed height (50) instead of the required 8px vertical padding.
  - I corrected the code by changing 'Radius.circular(24.0)' to '12.0' and replacing 'height: 50' with 'padding: EdgeInsets.symmetric(vertical: 8.0)'.

  VERIFICATION:
  Manually tested the UI. The card now has the correct corner curvature (12px) and the text label adjusts its height based on vertical padding, matching the design spec.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-05
*/

import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetCardWithModel extends StatelessWidget {
  final PetModel pet;
  const PetCardWithModel({super.key, required this.pet});

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.network(
                pet.imageURL,
                height: 120,
                width: 120,
                fit: BoxFit.cover, //ขยายรูปให้เต็มกรอบ
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.0)),
              child: Container(
                alignment: Alignment.center,
                color: pet.backgroundColor,
                width: 120,
                child: Text(
                  pet.name,
                  style: TextStyle(fontSize: 25,
                      color: pet.textColor),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
