/*
  Flutter Albums List with Environment Variables and Error Handling

  This program demonstrates fetching a list of 100 albums from a  API.
  It implements production-level practices including environment configuration,
  detailed error handling for specific HTTP status codes, and efficient list rendering.

  Concepts used:
  - Environment Variables: Using 'flutter_dotenv' to separate API configuration from code.
  - Error Handling: Managing 404 (Not Found) and 500 (Server Error) gracefully.
  - ListView.builder: Optimizing memory usage for displaying large datasets.
  - String Interpolation: Safely combining base URLs and paths.


  Note:
  - The core logic, FutureBuilder structure, and Data Model (Album)
    are based on the Ajarn's instructional materials.
  - AI was consulted for UI styling, environment variable implementation,
    and professional error messaging.
  --------------------------------------------------
  AI Documentation
  AI Tool: Gemini Flash

  Prompt 1:
  "How can I retrieve and use BASE_URL and ALBUMS_PATH from the .env file in my fetch function?"

  Analysis and Application:
  - The AI explained how to use 'dotenv.env['KEY']' to access values.
  - It suggested using String Interpolation ('$baseUrl$path') to combine them into a full URL.
  - This satisfies the lab requirement to avoid hardcoding sensitive or configurable strings.

  Prompt 2:
  "Please provide professional English error messages for HTTP 404 and 500 status codes."

  Analysis and Application:
  - The AI provided specific messages: 'Album not found' for 404 and 'Server error' for 500.
  - This allows the app to inform the user exactly what went wrong, rather than just showing a generic error, which aligns with the "Graceful Failure Recovery" objective.

  --------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-17
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/album.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// อ้างอิงจากโค้ดใน Document
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

Future<List<Album>> fetchAlbums() async {
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String path = dotenv.env['ALBUMS_PATH'] ?? '';
  final String url = '$baseUrl$path';

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'application/json, text/plain, */*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Connection': 'keep-alive',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Error 404: Album not found. Please check the URL.');
    } else if (response.statusCode == 500) {
      throw Exception('Error 500: Server error. Please try again later.');
    } else {
      throw Exception('Failed to load albums: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //มีการรองรับโหมด light และ dark
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const AlbumPage(),
    );
  }
}

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final baseStyle = textTheme.bodyMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('Fetch Albums')),
      body: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${snapshot.error}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            );

            //สร้าง listview เพื่อเเสดง 100 รายการ
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final album = snapshot.data![index];
                return ListTile(
                  leading: Text(
                    '${album.id}.',
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                  title: Text(
                    album.title,
                    style: textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                );
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
