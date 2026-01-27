/* KKU Faculty List App - Main Entry Point
   Entry point for the application. Sets up the theme and displays the faculty list.

   AI Documentation
   AI Tool: Gemini 3 Pro

   Prompt: "Can I use the length of other lists (like 'facultyThaiName' or 'facultyImageUrl') to drive List.generate instead of 'facultyName'?"

   Prompt answer analysis and application:
   - The AI explained that **Yes**, you can use the length of any list (`.length`) as the counter for `List.generate`.
   - **Condition:** It emphasized that **all parallel lists must have the exactly same length**.
   - If the lists are synchronized (e.g., all have 3 items), it makes no difference which one is used as the reference.
   - Application: I understood that using `facultyName.length` is just a choice, and I could technically use `facultyImageUrl.length` as long as I ensure all data lists are consistent.

   VERIFICATION:
   - Validated that all static lists (name, thaiName, description, imageUrl) have the same number of items (3 items).
   - The app runs correctly without 'RangeError' because the index used in the loop exists in all lists.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/


import 'package:flutter/material.dart';
import 'models/faculty_model.dart';
import 'screens/faculty_detail.dart';
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MainFacultyList(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

//.....จากตัวอย่างในสื่อการสอนของอาจารย์

class MainFacultyList extends StatefulWidget {
  const MainFacultyList({super.key});

  @override
  _MainFacultyListState createState() => _MainFacultyListState();
}

class _MainFacultyListState extends State<MainFacultyList> {
  static List<String> facultyName = [
    'Engineering', 'Medicine', 'Architecture'
  ];
  static List<String> facultyThaiName = [
    'วิศวกรรมศาสตร์', 'แพทยศาสตร์', 'สถาปัตยกรรมศาสตร์'
  ];
  static List<String> facultyDescription = [
    'https://www.en.kku.ac.th/web/',
    'https://www.med.kku.ac.th/web/',
    'https://www.arch.kku.ac.th/web'
  ];
  static List<String> facultyImageUrl = [
    'assets/images/faculties/en.jpg',
    'assets/images/faculties/med.jpg',
    'assets/images/faculties/arch.jpg'
  ];

  final List<FacultyModel> facultyData = List.generate(
    facultyName.length,
        (index) => FacultyModel(
      name: facultyName[index],
      thaiName: facultyThaiName[index],
      imageUrl: facultyImageUrl[index],
      description: facultyDescription[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KKU Faculties"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.arrow_right),
              title: Text(facultyData[index].name),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FacultyDetail(
                    faculty: facultyData[index],
                  ),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}