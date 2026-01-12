/* A widget that constructs the layout for a single quiz question.
   It vertically divides the screen into three sections: Title, Image, and Choices using Expanded widgets.

  AI Documentation
  AI Tool: Gemini 3 Pro

  Prompt 1: "What is aspect ratio?"
  Prompt answer analysis and application:
  - The AI defined it as the ratio of width to height.
  - It suggested using the 'AspectRatio' widget to maintain image consistency across different screen sizes.
  - I implemented 'AspectRatio(aspectRatio: 1.75)'  to keep the image proportionate.

  Prompt 2: "I used expanded but the balance is off. Is there a way to configure expanded?"
  Prompt answer analysis and application:
  - The AI introduced the 'flex' property in Expanded widgets to control the ratio of space distribution.
  - I configured the layout with a 1:3:4 ratio (Title:Image:Choices) to achieve a balanced UI.

  Prompt 3: "How do I access specific choices from the list to arrange them in a 2x2 grid?"
  Prompt answer analysis and application:
  - The AI explained that instead of displaying the entire list at once, I can access individual widgets using their index (e.g., 'choices[0]', 'choices[1]').
  - I applied this method to manually place the first two choices in the top Row and the next two in the bottom Row.

  @author Duangkamon Chaithongsri
  @date 2026-01-12
  @version 1.0.0
*/

import 'package:flutter/material.dart';
import '../components/question_choice.dart';

class QuestionWithChoices extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  const QuestionWithChoices({
    super.key,
    required this.title,
    required this.choices,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //section1 : title
        Expanded(
          flex: 1,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

        //section2 : image
        Expanded(
          flex: 3,
          child: Center(
            child: AspectRatio(
              aspectRatio: 1.75,
              child: Image.asset(imagePath),
            ),
          ),
        ),

        //section 3 : choices
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [choices[0], choices[1]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [choices[2], choices[3]],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
