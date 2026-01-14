/* A widget that displays contact details (Address, Phone, Email) with a styled layout.
   It creates a card-like effect with specific padding strategies to ensure
   dividers stretch across the full width while content remains indented.

   AI Documentation
   AI Tool: Gemini 3 Pro

   Prompt 1: "How to make the divider touch the edges of the card?"
   Prompt answer analysis and application:
   - The AI explained that padding on the parent container restricts the divider.
   - The solution applied is setting 'padding: EdgeInsets.symmetric(vertical: 30)' on the parent Container (no horizontal padding).
   - Then, 'Padding(padding: EdgeInsets.symmetric(horizontal: 20))' is applied individually to each content Row to indent the text/icons.

   Prompt 2: "How to add a separator line?"
   Prompt answer analysis and application:
   - The AI suggested using the 'Divider' widget.
   - I implemented 'Divider(color: Colors.grey, thickness: 1.5)' to visually separate the address from the contact info.

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-01-14
*/


import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String addressName;
  final String addressInfo;
  final String email;
  final String phone;

  const ContactInfo({
    super.key,
    required this.addressName,
    required this.addressInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30), //ขอบบนล่าง
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Row Address
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), //ขอบซ้ายขวา
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 30, color: Colors.deepOrange),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressName, style: TextStyle(fontSize: 18)),
                    Text(addressInfo),
                  ],
                ),
              ],
            ),
          ),

          Divider(color: Colors.grey, thickness: 1.5, height: 50),

          // Row phone
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.phone, size: 30, color: Colors.deepOrange),
                SizedBox(width: 20),
                Text(phone, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SizedBox(height: 30),
          // Row email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.email, size: 30, color: Colors.deepOrange),
                SizedBox(width: 20),
                Text(email, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
