/*
  Flutter API Integration with Custom Data Model and Theme UI

  This program demonstrates integrating a REST API into a Flutter application
  using a custom Data Model. It fetches user information, parses nested JSON,
  and displays the data using Material Design 3 Typography and Color Schemes.

  Concepts used:
  - FutureBuilder: Managing UI states (loading, error, success) based on asynchronous data.
  - Custom Data Models: Using factory constructors (fromJson) to map JSON to Dart objects.
  - RichText & TextSpans: Applying multiple styles within a single block of text.
  - Material 3 Theme: Utilizing ColorScheme and TextTheme for a consistent UI.

  Note: The core structure and logic of this lab are primarily based on
  the instructional code provided by Ajan.
  --------------------------------------------------
  AI Documentation
  AI Tool: Gemini Fast

  Prompt 1:
  "I followed the instructions to use bodyMedium and titleLarge, but why is my
  font size still smaller than the professor's example?"

  Analysis and Application:
  - The AI explained that by explicitly setting `fontSize: baseStyle?.fontSize`
    (from bodyMedium), it overrides the naturally larger size of `titleLarge`.
  - To match the professor's visual scale while keeping the logic, the AI suggested
    ensuring `useMaterial3: true` is active and adjusting the base style to `bodyLarge`
    or removing the manual font size override if a larger appearance is desired.

  Prompt 2:
  "How do I make the second line of the text align to the left instead of the center?"

  Analysis and Application:
  - The AI recommended changing `textAlign` in `RichText` from `TextAlign.center`
    to `TextAlign.left`.
  - To prevent the text from sticking to the screen edge, the AI suggested
    wrapping the widget in a `Container` with `alignment: Alignment.centerLeft`
    and adding `padding`.

  --------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-13
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

Future<User> fetchUser() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    headers: {'User-Agent': 'Mozilla/5.0', 'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final baseStyle = textTheme.bodyMedium;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Call API By Duangkamon 1151')),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: FutureBuilder<User>(
              future: futureUser,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: baseStyle?.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text: user.name,
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            //fontSize: baseStyle?.fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' works at ',
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.secondary,
                            //fontSize: baseStyle?.fontSize,
                          ),
                        ),
                        TextSpan(
                          text: user.company,
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.secondary,
                            // fontSize:
                            //baseStyle?.fontSize, // บังคับขนาดตาม bodyMedium
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
