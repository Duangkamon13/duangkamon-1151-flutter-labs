/* The contact list screen displaying a scrollable list of contacts.
   It uses ListView.separated to handle list rendering with custom spacing.

   Key Features:
   - Displays a list of Contact objects using a custom-styled Container.
   - Implements a FloatingActionButton to dynamically add new contacts.
   - Uses 'ListView.separated' to efficiently build list items with gaps.

  AI Documentation
  AI Tool: Gemini 3 Pro

  Prompt 1: "How can I remove the divider line and just have empty space between items?"
  Prompt answer analysis and application:
  - The AI suggested using 'SizedBox(height: ...)' inside the 'separatorBuilder' instead of 'Divider()'.
  - I applied this to create a clean 12px vertical gap between each contact card without any visible lines.

  Prompt 2: "Where should I put padding to space the container from the screen edge? It didn't work on the container."
  Prompt answer analysis and application:
  - The AI explained the difference between padding (internal) and margin (external).
  - It recommended applying 'padding' directly to the 'ListView' widget itself (Method 2).
  - I implemented 'padding: const EdgeInsets.all(16.0)' in the ListView to create uniform spacing around the entire list content from the screen edges.

  VERIFICATION:
  - Verified on emulator: The list now has a nice gap from the screen edges (left/right/top/bottom).
  - The items are separated by empty space, not lines.
  - Tapping the FAB adds a new contact correctly.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-07
*/

import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  int _counter = 1;

  //Data from sheet
  final List<Contact> _contacts = [
    const Contact(name: "John Doe", phoneNumber: "123-456-7890"),
    const Contact(name: "Jane Smith", phoneNumber: "987-654-3210"),
    const Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
  ];

  // Method to add a new contact
  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $_counter",
          phoneNumber: "000-000-${_counter.toString().padLeft(4, '0')}",
        ),
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                ),
              ],
            ),

            child: ListTile(
              title: Text(_contacts[index].name ,
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
              trailing: Text(_contacts[index].phoneNumber , style: TextStyle(color: colorScheme.secondary),),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20.0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _addContact,
        child: const Icon(Icons.add),
      ),
    );
  }
}