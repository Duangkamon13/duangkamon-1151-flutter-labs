/* A custom widget QuoteCard with Container
  This widget display quote image and the author's name
  In both container that is decorated with BoxDecoration with rounded
  corner

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt: Can I declare a constant color variable like 'const Color redColor = ...'?
  Prompt answer analysis and application:
  - The AI confirmed that declaring a constant color variable is a good practice (DRY principle).
  - It suggested placing the variable inside the build method or class to make the code cleaner and easier to maintain.
  - I applied this by creating a 'redColor' variable and using it for both the Text style and AppBar background.

@author Duangkamon Chaithongsri
@version 1.0.0
@date 2025-12-13
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteContainerCard());
}

class QuoteContainerCard extends StatelessWidget {
  const QuoteContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String Fname = "Charles";
    const String Lname = "Leclerc";
    const TextStyle nameStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(250, 133, 14, 53),
    );
    const Color redColorRGB = Color.fromARGB(250, 133, 14, 53);
    return MaterialApp(
      title: "QuoteCard",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: redColorRGB,
          foregroundColor: Colors.white,
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
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 5, offset: const Offset(0, 9)),
                  ],
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Image.asset('assets/images/Quote.jpg'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber[400],
                  border: Border.all(color: redColorRGB, width: 2.0),
                  boxShadow: [
                    BoxShadow(blurRadius: 5, offset: const Offset(0, 9)),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
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
