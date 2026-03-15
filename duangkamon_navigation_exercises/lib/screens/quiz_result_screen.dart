
/*
  QuizResultScreen
  This widget displays the final score in a centered, rounded container
  and provides a detailed review of all answers using the Deferred Feedback
  pattern. It focuses on rendering a scrollable list of results with
  dynamic color coding based on user performance.
  Key UI Enhancements:
  - Centered Score Card: A fixed-size rounded container for visual impact.
  - Logical Feedback Rendering: Uses conditional logic to determine text and
    color for each result item.
  - Bordered List Items: Implements RoundedRectangleBorder on Cards to create
    clean, defined boundaries for each question review.

  --------------------------------------------------
  AI Documentation
  AI Tool: Gemini (Fast)

  Prompt 1:
  "How can we create a ListView that reveals specific colors and feedback
   only when the final results are displayed?"

  Analysis and Application:
  - The AI suggested using 'ListView.builder' paired with an 'indexWhere' logic
    to compare the user's selection with the correct choice.
  - Dynamic variables ('feedback' and 'textColor') are assigned within the
    builder to apply Green (Correct), Red (Incorrect), or Orange (Unanswered)
    at render-time, fulfilling the Deferred Feedback pattern.

  --------------------------------------------------

  Prompt 2:
  "How can we apply borders or rounded edges to each item within the ListView?"

  Analysis and Application:
  - The AI recommended wrapping each 'ListTile' inside a 'Card' widget.
  - By using the 'shape' property with 'RoundedRectangleBorder', we can
    define a 'borderRadius' (e.g., 15) to ensure each result item has
    clean, rounded corners that match the overall app theme.

  --------------------------------------------------

  @author Duangkamon Chaithongsri
  @version 3.2.0
  @date 2026-03-10
*/

import 'package:flutter/material.dart';
import 'package:duangkamon_interactivity_exercises/models/question.dart';

class QuizResultScreen extends StatelessWidget {
  final List<Question> questions;
  final Map<int, int?> selectedAnswers;
  final int totalScore;
  final VoidCallback onRestart;

  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.totalScore,
    required this.onRestart,
  });
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Score",
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "$totalScore / ${questions.length}",
                        style: textTheme.displayMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final userPick = selectedAnswers[index];
                  final correctIdx = question.choices.indexWhere((c) =>
                  c.isCorrect);
                  final correctChoice = question.choices[correctIdx];

                  String feedback;
                  Color textColor;

                  if (userPick == null) {
                    feedback = "Not answered - Correct: ${correctChoice.name}";
                    textColor = Colors.orange;
                  } else if (userPick == correctIdx) {
                    feedback = "${correctChoice.name} ✓";
                    textColor = Colors.green;
                  } else {
                    feedback = "${question.choices[userPick]
                        .name} ✗ Should be ${correctChoice.name}";
                    textColor = Colors.red;
                  }

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 0,
                    color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primaryContainer,
                        child: Text(
                          "${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(question.title),
                      subtitle: Text(
                        feedback,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight
                              .bold, // เพิ่มความหนาให้อ่านง่ายขึ้น
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
              // ปรับระยะห่างปุ่ม
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer,
                  foregroundColor: colorScheme.onPrimaryContainer,
                  minimumSize: const Size(200, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Restart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}