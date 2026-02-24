/*
  InteractiveRatings
  This StatefulWidget displays a row of interactive star icons that allows users
  to input a rating. It manages its local state and persists the rating value
  using SharedPreferences.

  Concepts used:
  - StatefulWidget for local state management (currentRating).
  - Dependency Injection (receiving SharedPreferencesWithCache from the parent).
  - Synchronous SharedPreferences reads in initState() and writes during state updates.
  - Dynamic widget generation using List.generate().
  - Material 3 ColorScheme integration (avoiding hardcoded colors).

  AI Documentation
  AI Tool: Gemini Pro

  Prompt:
  "How can I modify my existing interactive ratings widget to save data using
   SharedPreferencesWithCache?"

  Analysis and Application:
  - The AI suggested replacing the 'activeColor' and 'inactiveColor' parameters
    with a required 'prefs' parameter (SharedPreferencesWithCache).
  - The AI explained that with the cached version of SharedPreferences, reads
    are synchronous. Thus, prefs.getInt() can be used directly inside initState()
  - A helper method (_updateRating) was introduced to handle both updating the
    UI via setState() and persisting the data simultaneously.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-24
*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveRatings extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  final double starSize;
  final int totalStars;

  const InteractiveRatings({
    super.key,
    required this.prefs,
    this.starSize = 30.0,
    this.totalStars = 5,
  });

  @override
  State<InteractiveRatings> createState() => _InteractiveRatingsState();
}

class _InteractiveRatingsState extends State<InteractiveRatings> {
  int currentRating = 0;
  final String _ratingKey = 'profileRating';
  @override
  void initState() {
    super.initState();
    currentRating = widget.prefs.getInt(_ratingKey) ?? 0;
  }
  void _updateRating(int newRating) {
    setState(() {
      currentRating = newRating;
    });
    widget.prefs.setInt(_ratingKey, newRating);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final activeColor = colorScheme.primary;
    final inactiveColor = colorScheme.outlineVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.totalStars, (index) {
        return GestureDetector(
          onTap: () {
            _updateRating(index + 1);
          },
          child: Icon(
            index < currentRating ? Icons.star : Icons.star_border,
            color: index < currentRating ? activeColor : inactiveColor,
            size: widget.starSize,
          ),
        );
      }),
    );
  }
}