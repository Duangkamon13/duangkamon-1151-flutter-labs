/* The main entry point for the 'Profile Card' application with Responsive Design (Lab 6.1).
   It switches between Portrait and Landscape layouts based on device orientation.

   AI Documentation
   AI Tool: Gemini 3 Pro

   Prompt: "Should I use Expanded widgets for the landscape columns, or just use Main/Cross Axis Alignment?"
   Prompt answer analysis and application:
   - The AI analyzed that using 'Row' with simple alignment relies on the intrinsic size of the children, which risks overflow errors if text is long.
   - The AI recommended using 'Expanded' (as currently implemented).
   - Reason 1: 'Expanded' enforces a strict width ratio (Flex 1:2) ensuring consistent layout structure.
   - Reason 2: It constrains the width of the columns, forcing text to wrap instead of causing an overflow error.
   - Application: I used the 'Expanded' widgets with flex factors to ensure the layout is robust and responsive.

   @author Duangkamon Chaithongsri
   @version 1.1.0
   @date 2026-01-16
*/


import 'package:flutter/material.dart';
import 'components/contact_image.dart';
import 'components/contact_info.dart';
import 'components/ratings.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCardRatingResponsive(),
    ),
  );
}

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {

    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: isPortrait ? _buildPortraitLayout() : _buildLandscapeLayout(), //ตัวอย่างโค้ดจากสไลด์
        ),
      ),
    );
  }

//โค้ดแลปก่อนหน้า
  Widget _buildPortraitLayout() {
    return Column(
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
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactImage(
                imagePath: 'assets/images/shinchan.jpg',
                name: "โนะฮาร่า ชินโนสุเกะ",
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
      ],
    );
  }
}
