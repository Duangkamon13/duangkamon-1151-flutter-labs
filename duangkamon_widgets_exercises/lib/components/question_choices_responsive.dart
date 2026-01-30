/* A reusable widget that displays a question, an image, and a list of answer choices.
It adapts its layout based on the screen orientation (Portrait vs Landscape).

AI Documentation
AI Tool: Gemini 3 Pro
[Question 1]
Prompt: "How can I make the image responsive and fix the GridView layout?"
Analysis & Application:
- Image Resizing: The AI suggested using Expanded with a flex value to allocate space dynamically.
- Application: Used Expanded(flex: 4) for the image container to ensure it takes up appropriate vertical space.
- GridView Configuration: The AI recommended adjusting childAspectRatio based on orientation.
- Application: Implemented logic isPortrait ? 2.5 : 8.0 to make buttons flatter in landscape mode, preventing overflow.
[Question 2]
Prompt: "Previously, we manually placed choices using Rows and specific indices (e.g., choices[0], choices[1]). Is there a better, more dynamic way to write this?"
Analysis & Application:
- Problem: Hardcoding indices inside Column/Row widgets is rigid, error-prone, and doesn't handle dynamic list sizes well.
- Solution: The AI recommended using 'GridView.builder'.
- Benefit: It automatically generates the layout based on itemCount and calculates rows/columns on the fly.
- Application: Refactored the nested Row structure into a GridView.builder, using itemBuilder to dynamically render choices[index]. This makes the code cleaner and scalable.


 @author Duangkamon Chaithongsri
 @version 1.0.0
 @date 2026-01-30
*/


import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import 'question_choice.dart';

//ส่วนของโค้ดเดิม
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
