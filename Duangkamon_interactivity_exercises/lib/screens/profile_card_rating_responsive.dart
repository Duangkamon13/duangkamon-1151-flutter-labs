/*
  ProfileCardRatingResponsive
  This widget builds a responsive profile card that adapts to
  portrait and landscape orientations.

  Concepts used:
  - MediaQuery for responsive design
  - Separation of layout methods
  - Reusable components from external package
  - Material 3 ColorScheme
  - Composing Stateless and Stateful widgets together

  AI Documentation
  AI Tool: ChatGPT (GPT-5)

  Prompt:
  "Can I reuse the original layout and simply replace the static rating
   with an interactive rating widget?"

  Analysis and Application:
  - The AI explained that the original responsive layout
    (Column/Row structure and MediaQuery logic) does not need to be changed.
  - The existing layout can be reused as it is.
  - Only the static rating section needs to be replaced
    with the InteractiveRatings StatefulWidget.
  - This follows Flutter’s widget composition principle,
    where layout structure and interactive behavior are separated.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_widgets_exercises/components/contact_image.dart';
import 'package:duangkamon_widgets_exercises/components/contact_info.dart';
import '../components/interactive_ratings.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});
//โค้ดจากแลปก่อน และถูกปรับปรุงที่่ rating ให้เป็นแบบ rating Respondsive
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: isPortrait
              ? _buildPortraitLayout(colorScheme)
              : _buildLandscapeLayout(colorScheme),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const ContactImage(
          imagePath: 'assets/images/shinchan.jpg',
          name: "โนะฮาร่า ชินโนสุเกะ",
        ),

        const ContactInfo(
          addressName: "Shinchan's Place",
          addressInfo: "Saitama, Japan, 359-000",
          email: "shinchan555@example.com",
          phone: "+81-12-345-6789",
        ),

        InteractiveRatings(
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.onPrimaryContainer,
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactImage(
                imagePath: 'assets/images/shinchan.jpg',
                name: "โนะฮาร่า ชินโนสุเกะ",
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ContactInfo(
                addressName: "Shinchan's Place",
                addressInfo: "Saitama, Japan, 359-000",
                email: "shinchan555@example.com",
                phone: "+81-12-345-6789",
              ),
              InteractiveRatings(
                activeColor: colorScheme.primary,
                inactiveColor: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
