/* A custom widget QuoteCard.
   This widget sets up the UI theme and renders the quote image above
   the author's name, with both elements sharing the vertical space.

AI Documentation
   1. AI Tool: Gemini 3 Pro
   2. Prompt: What are common TextStyle properties and how to declare a variable for text styling?
   3. Prompt answer analysis and application:
    - The AI listed common properties such as fontSize, fontWeight, color , etc.
    - It suggested creating variables to organize the styles.
    - I applied this by creating a 'nameStyle' variable and using it for both the First Name and Last Name widgets.

VERIFICATION:
Run App (Checked that the app compiles and the UI renders with the correct styles).

@author Duangkamon Chaithongsri
@version 1.0.0
@date 2025-12-13
*/
import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String Fname = "Charles";
    const String Lname = "Leclerc";
    const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(250, 133, 14, 53),
    );
    return MaterialApp(
      title: "QuoteCard",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(250, 133, 14, 53),
          foregroundColor: Color.fromARGB(250, 252, 245, 238),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My favorite Quote",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/images/Quote.jpg')),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Fname, style: nameStyle),
                    SizedBox(width: 10),
                    Text(Lname, style: nameStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
