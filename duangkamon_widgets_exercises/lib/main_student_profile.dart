import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String name = "Duangkamon Chaithongsri";
    const String id = "663040115-1";
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink[100],
          foregroundColor: Colors.white54,
        ),
      ),
      title: "Student",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                id,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
