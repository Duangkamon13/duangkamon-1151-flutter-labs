/*
  InteractiveRatings Widget
  This widget implements an interactive star rating system using StatefulWidget.
  It demonstrates how UI state is stored and updated dynamically when the user
  interacts with the interface.

  Key Features:
  - Uses StatefulWidget to maintain rating state.
  - Uses GestureDetector to detect tap interactions.
  - Uses setState() to trigger UI rebuild.
  - Applies semantic Material 3 colors passed from parent widget.
  - Dynamically generates star icons using List.generate().

  Behavior:
  - Tapping a star sets the rating to (index + 1).
  - All stars with index < currentRating are displayed using activeColor.
  - Remaining stars use inactiveColor.

  AI Documentation
  AI Tool: ChatGPT (GPT-5)

  Prompt 1:
  "How do I implement an interactive star rating system using StatefulWidget in Flutter?"

  Analysis and Application:
  - The AI recommended storing the rating as an integer variable inside the State class.
  - Each star is wrapped with GestureDetector to detect tap events.
  - setState() is used to update currentRating and trigger a rebuild.
  - List.generate() is used to efficiently create multiple star widgets.

  Prompt 2:
  "How can I conditionally change the color of stars when tapped?"

  Analysis and Application:
  - The AI suggested comparing the current star index with the stored rating.
  - The condition (index < currentRating) determines whether a star should be active.
  - Active stars use activeColor, and inactive stars use inactiveColor.
  - This ensures dynamic visual feedback based on user interaction.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
class InteractiveRatings extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final double starSize;
  final int totalStars;

  const InteractiveRatings({
    super.key,
    required this.activeColor,
    required this.inactiveColor,
    this.starSize = 33.0,
    this.totalStars = 5,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int currentRating = 0;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.totalStars, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentRating = index + 1;
            });
          },
          child: Icon(
            index < currentRating ? Icons.star : Icons.star_border,
            color: index < currentRating ? widget.activeColor : widget.inactiveColor,
            size: widget.starSize,
          ),
        );
      }),
    );
  }
}