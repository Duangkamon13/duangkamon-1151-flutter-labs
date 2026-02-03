
/* The NewsFeedScreen widget that builds a responsive news gallery.
   It utilizes 'LayoutBuilder' to switch between a 'ListView' (Mobile)
   and a 'GridView' (Tablet/Desktop) based on the available width.
   The UI components are styled using Material Design 3 typography and color schemes.


  AI Documentation
  AI Tool: Gemini 3 Flash

  Prompt 1: "Can I use 'theme.textTheme.bodyMedium(color: ...)' to style text directly?"
  Analysis and Application:
  - The AI clarified that Text Styles in Flutter are Objects, not Functions. Therefore, parameters cannot be passed via parentheses.
  - To modify a theme's style, the '.copyWith()' method must be used to inherit existing Material 3 properties while overriding specific ones like color.
  - I applied '.copyWith()' to all Text widgets to ensure the UI adheres to the Material 3 Typography scale.

  Prompt 2: "Why does the implementation require more parameters than shown in the lecture slides (e.g., context and articles)?"
  Analysis and Application:
  - The AI explained that lecture slides often provide "Pseudo-code" to highlight Core Logic. However, a functional implementation requires 'context' to access Themes/Padding and 'articles' to provide data for the UI.
  - I implemented the helper functions with full parameters (context, columnCount, articles) to ensure modularity and avoid compilation errors.


  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-02-03
*/


import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../models/article_model.dart';

class NewsFeedScreen extends StatelessWidget {
  final List<Article> articles;
  const NewsFeedScreen({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News Feed')),
      //โค้ดจาก Document
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final columnCount = Responsive.getColumnCount(width);
          if (Responsive.isMobile(width)) {
            return _buildListView(context, articles);
          } else {
            return _buildGridView(context, columnCount, articles);
          }
        },
      ),
    );
  }

  //ฟังก์ชันสร้าง ListView
  Widget _buildListView(BuildContext context, List<Article> articles) {
    return ListView.builder(
      padding: Responsive.getScreenPadding(context),
      itemCount: articles.length,
      itemBuilder: (context, index) =>
          _buildArticleCard(context, articles[index]),
    );
  }

  //ฟังก์ชันสร้าง GridView จากของอาจารย์
  Widget _buildGridView(
    BuildContext context,
    int columnCount,
    List<Article> articles,
  ) {
    return GridView.builder(
      padding: Responsive.getScreenPadding(context),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 1.3,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index) =>
          _buildArticleCard(context, articles[index]),
    );
  }

  //ฟังก์ชันสร้าง Card
  Widget _buildArticleCard(BuildContext context, Article article) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              article.title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.date,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  "${article.readingTimeMinutes.toString()} min read",
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
