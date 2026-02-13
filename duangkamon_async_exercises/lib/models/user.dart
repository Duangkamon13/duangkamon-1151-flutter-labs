/*
  Data Model: User

  This model is implemented based on the course materials (Slide page 83).
  It handles nested JSON parsing to extract specific fields required for the lab.

  Note: The core structure and logic of this lab are primarily based on
  the instructional code provided by the Ajan.
  --------------------------------------------------
  AI Documentation
  AI Tool: I don't use any AI for code
  --------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-13
*/

class User {
  final int id;
  final String name;
  final String company;
  User({
    required this.id,
    required this.name,
    required this.company,
  });
  // จาก document กำหนด เป็น json
  //โค้ดจาก slide หน้า 83
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      company: json['company']['name'],
    );
  }
}