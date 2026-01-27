/* Star Rating Component
   Displays a row of 5 stars based on a double rating value (e.g., 3.5 or 4.2).
   ---------------------------------------------------------------------------
   AI Documentation
   ---------------------------------------------------------------------------
   AI Tool: Gemini 3 Pro

   Prompt: "How can I use List.generate to render star ratings (Full, Half, Empty) based on a score?"

   Analysis & Application:
   - **Concept:** `List.generate(5, (index) { ... })` creates a loop that runs 5 times with `index` from 0 to 4. Each index represents a star's position.

   - **Logic Implementation:**
     1. **Full Stars:** Calculated using `rating.floor()`.
        - If the current `index` is less than `fullStars`, it means this position is fully covered by the score. (e.g., rating 3.5, indices 0, 1, 2 are < 3, so they are Full Stars).

     2. **Half Star:** Calculated using `(rating - fullStars)`.
        - If the current `index` equals `fullStars` (the position immediately after the full stars) AND the decimal remainder is >= 0.5, it renders a Half Star.

     3. **Empty Star:**
        - Any other index that doesn't fit the above conditions is rendered as an Empty Star (border only).

   - Application: Implemented this 3-step logic inside the `List.generate` callback to return the correct Icon widget for each position.

   ---------------------------------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/

import 'package:flutter/material.dart';
class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor(); //ตาม hint ของอาจารย์
    double HalfStar = (rating - fullStars) ;
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 18);
        } else if (index == fullStars && HalfStar >= 0.5) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 18);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 18);
        }
      }),
    );
  }
}