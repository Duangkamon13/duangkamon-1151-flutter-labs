/*
  Album Data Model

  This class represents an Album entity retrieved from the API.
  It converts JSON data into a structured Dart object using a factory constructor.

  Attributes:
  - userId: The ID of the user who owns the album.
  - id: The unique identifier of the album.
  - title: The title of the album.

  --------------------------------------------------
   AI Documentation
   AI Tool: I don't use any AI tools.(for code)

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-17
*/

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}