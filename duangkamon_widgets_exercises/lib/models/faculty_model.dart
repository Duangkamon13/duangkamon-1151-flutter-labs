/* FacultyModel class
   A data model representing a faculty with English name, Thai name, image URL, and description.

   AI Documentation
   AI Tool: I don't use any AI tools.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/

class FacultyModel {
  final String name;
  final String thaiName;
  final String imageUrl;
  final String description;

 const FacultyModel({
    required this.name,
    required this.thaiName,
    required this.imageUrl,
    required this.description,
  });
}