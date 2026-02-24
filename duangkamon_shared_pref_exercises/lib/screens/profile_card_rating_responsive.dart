/*
  ProfileCardRatingResponsive
  This widget builds a responsive profile card that adapts to
  portrait and landscape orientations, and acts as a middleman
  to pass SharedPreferences to the interactive rating widget.

  Concepts used:
  - Dependency Injection (passing SharedPreferencesWithCache)
  - MediaQuery for responsive design (Orientation)
  - Separation of layout methods (_buildPortraitLayout, _buildLandscapeLayout)
  - Reusable components from external package
  - Material 3 ColorScheme
  - Composing Stateless and Stateful widgets together

  AI Documentation
  AI Tool: Gemini Pro

  Prompt:
  "How can I insert SharedPreferences into my existing responsive code
   and pass it down to the rating widget?"

  Analysis and Application:
  - The AI suggested using Dependency Injection by adding `prefs`
    as a required constructor parameter to this widget.
  - The AI explained that the original responsive layout
    (Column/Row structure and MediaQuery logic) does not need to be changed
    and can be fully reused.
  - The static rating section was replaced with the InteractiveRatings
    widget, passing `prefs` into it so the child widget can handle
    its own local state and persistence synchronously.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-24
*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:duangkamon_widgets_exercises/components/contact_image.dart';
import 'package:duangkamon_widgets_exercises/components/contact_info.dart';
import '../components/interactive_ratings.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  final SharedPreferencesWithCache prefs;
  const ProfileCardRatingResponsive({super.key, required this.prefs});
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
          prefs: prefs,
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
        const SizedBox(width: 30),
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
                prefs: prefs,
              ),
            ],
          ),
        ),
      ],
    );
  }
}