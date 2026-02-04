/* The Submitbutton widget that triggers a confirmation dialog.
   This component follows the structure provided in the course materials
   to demonstrate event handling and dialog navigation in Flutter.

  AI Documentation - I don't use any AI tools for coding this.
  AI Tool: Gemini 3 Flash

  Note on Implementation:
  - This code was implemented based on the provided course materials and instructor's examples.
  - AI was not used for the logic or structure of this specific component.
  - The AI tool was only utilized to format this documentation and provide English comments for academic reporting.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-04
*/

import 'package:flutter/material.dart';
class Submitbutton extends StatelessWidget {
  const Submitbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirmation'),
                content: const Text('Are you sure you want to submit?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text('Submit'),
      ),
    );
  }
}
