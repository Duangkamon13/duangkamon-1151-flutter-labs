/* Article Model Class
   A blueprint for article data used within the News Feed application.
   This class encapsulates all necessary fields for a news item, including
   titles, descriptions, timestamps, and metadata like reading time.

   AI Documentation
   AI Tool: I don't use any AI tools.

   @author Duangkamon Chaithongsri
   @version 1.0.0
   @date 2026-02-03
*/
class Article {
  final String title;
  final String description;
  final String date;
  final int readingTimeMinutes;

  const Article({
    required this.title,
    required this.description,
    required this.date,
    required this.readingTimeMinutes,
  });
}
