/* The main entry point for the 'Profile Card' application.
   It assembles the UI by combining custom components (ContactImage, ContactInfo, Ratings)
   and manages the application's theme (Light/Dark mode).

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-14
*/

import 'package:flutter/material.dart';
import 'components/contact_image.dart';
import 'components/contact_info.dart';
import 'components/ratings.dart';

void main() {
  runApp(const MainProfileCardRating());
}

class MainProfileCardRating extends StatelessWidget {
  const MainProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Card",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),

      themeMode: ThemeMode.system,

      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20), //โจทย์กำหนด
          color: Colors.cyanAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactImage(
                imagePath: 'assets/images/shinchan.jpg',
                name: "โนะฮาร่า ชินโนสุเกะ",
              ),
              ContactInfo(
                addressName: "Shinchan's Place",
                addressInfo: "Saitama, Japan, 359-000",
                email: "shinchan555@example.com",
                phone: "+81-12-345-6789",
              ),
              Ratings(defaultColor: Colors.black, ratingColor: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
