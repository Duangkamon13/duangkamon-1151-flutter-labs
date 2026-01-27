/* FacultyModel class
   A data model representing a structure of a single product object..

   AI Documentation
   AI Tool: I don't use any AI tools.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final double rating;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
  });
}