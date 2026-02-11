/*
  Question Model

  This class is defined based on the "Implementation Hints" from the provided
  lab documentation (Problem 4: Multi-Question Quiz).

  It serves as the data model for a single quiz question, storing:
  - title: The question text.
  - imagePath: The path to the image asset associated with the question.
  - choices: A list of Choice objects representing the possible answers.

  AI Documentation
  AI Tool: I don't use any ai tools for coding

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-11
*/
import 'choice.dart';
class Question {
  final String title;
  final String imagePath;
  final List<Choice> choices;

  const Question({
    required this.title,
    required this.imagePath,
    required this.choices,
  });
}
