/* The ProfileWithButton component that combines an image,
   credit text, and a submission button into a unified layout.

  AI Documentation
  AI Tool: Gemini 3 Flash

  Prompt: "Why does the ProfileWithButton stay at the top even with a Center widget?"
  Analysis & Application:
  - Layout Optimization: The AI identified that a 'Column' defaults to maximum height, which pushes content to the top.
  - Implementation: Added 'mainAxisSize: MainAxisSize.min' to shrink the column to the size of its children. This allows the parent 'Center' widget in ProfileScreen to successfully mid-align the entire block.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-04
*/
import 'package:flutter/material.dart';
import '../components/submit_button.dart';

class ProfileWithButton extends StatelessWidget {
  final String imagePath;
  final String photoCredit;

  const ProfileWithButton({
    super.key,
    required this.imagePath,
    required this.photoCredit,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        Text(
          'Photo Credit: $photoCredit',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        const Submitbutton(),
      ],
    );
  }
}