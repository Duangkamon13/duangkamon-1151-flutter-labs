/*
  QuestionWithChoicesResponsive

  This widget builds a responsive question screen that adapts
  to portrait and landscape orientations. It displays a title,
  an image, and a 2×2 grid of answer choices.

  Concepts used:
  - MediaQuery-based responsive layout
  - GridView.builder with crossAxisCount: 2
  - Reusable QuestionChoice widgets
  - Separation of layout and interaction logic

  AI Documentation
  AI Tool: ChatGPT (GPT-5)

  Prompt:
  "Can I reuse the original responsive layout code from the previous lab
   and keep the structure unchanged?"

  Analysis and Application:
  - The AI confirmed that the existing responsive layout
    (Column, Expanded, GridView.builder structure)
    can be reused without modification.
  - The original Responsive utility from the previous lab
    is reused to maintain consistent padding and orientation handling.
  - Only the QuestionChoice widget was updated separately
    to support interactive answer checking.
  - No changes were made to the core layout structure.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/


import 'package:flutter/material.dart';
import '../components/question_choice.dart';
import 'package:duangkamon_widgets_exercises/utils/responsive.dart';


//ส่วนของโค้ดเดิมที่นำมาจาก question_choices_responsive.dart
class QuestionWithChoicesResponsive extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  const QuestionWithChoicesResponsive({
    super.key,
    required this.title,
    required this.choices,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait = Responsive.isPortrait(context);
    EdgeInsets screenPadding = Responsive.getScreenPadding(context);

    return Padding(
      padding: screenPadding,
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 100,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              padding: EdgeInsets.all(isPortrait ? 20 : 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: isPortrait ? 2.5 : 8.0,
              ),
              itemCount: choices.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: choices[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
