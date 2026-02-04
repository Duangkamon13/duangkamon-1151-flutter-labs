/* The ProfileScreen widget that displays student information and a profile image.
   The layout is divided into a header (Name & ID) and a centered content area
   containing the image and action button. It uses Material Design 3 for
   the typography and color scheme.

  AI Documentation
  AI Tool: Gemini 3 Flash

  Prompt 1: "How can I prevent the top Row (Name and ID) from touching the screen edges?"
  Prompt answer analysis and application:
  - The AI noted that while 'SafeArea' prevents overlap with system UI, it does not provide internal spacing.
  - I applied a 'Padding' widget with '25.0' pixels around the header Row to create a clean, professional margin that matches the reference image.

  Prompt 2: "Why is the ProfileWithButton not centering vertically in the Column?"
  Prompt answer analysis and application:
  - The AI explained that the 'Column' naturally stacks items at the top. To occupy the remaining vertical space and center a widget, 'Expanded' and 'Center' are required.
  - I used 'Expanded' to let the middle section fill the screen and 'Center' to align the 'ProfileWithButton' exactly in the midpoint of that space.


  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-04
*/

import 'package:flutter/material.dart';
import '../components/profile_with_button.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String id;
  final String imagePath;
  final String photoCredit;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.id,
    required this.imagePath,
    required this.photoCredit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    id,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: ProfileWithButton(
                  imagePath: imagePath,
                  photoCredit: photoCredit,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
