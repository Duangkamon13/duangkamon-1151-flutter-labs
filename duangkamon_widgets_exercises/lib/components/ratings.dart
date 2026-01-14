/* A widget that displays a static 4-star rating using a row of icons.
   It customizes the star colors based on 'ratingColor' (active) and 'defaultColor' (inactive).

   AI Documentation
   AI Tool: I don't use any AI tools.


   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-14
*/

import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final Color defaultColor;
  final Color ratingColor;
  const Ratings({super.key,
    required this.defaultColor,
    required this.ratingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: ratingColor),
        Icon(Icons.star, color: defaultColor),
      ],
    );
  }
}
