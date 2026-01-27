/* Product Card Component
   A reusable widget that displays a single product's summary information in a card format.

   This component is responsible for rendering:
   - Product Image (Expanded to fill top space)
   - Product Name (Bold text)
   - Price (Formatted in Thai Baht)
   - Star Rating (Using a custom widget)

   It is designed to be interactive, allowing the parent widget to define the action when tapped via the 'onTap' callback.

   ---------------------------------------------------------------------------
   AI Documentation
   ---------------------------------------------------------------------------
   AI Tool: Gemini 3 Pro

   [Question 1]
   Prompt: "Why should I use InkWell instead of just detecting taps, and how do I use it correctly inside a Card?"
   Analysis & Application:
   - **Why:** The AI explained that 'InkWell' provides a visual **"Material Ripple Effect"** (splash animation) which gives better tactile feedback than a standard GestureDetector.
   - **How:** It must be placed inside a Material widget (like Card) and needs 'clipBehavior: Clip.antiAlias' on the Card to prevent the animation from overflowing rounded corners.

   [Question 2]
   Prompt: "Do I need to declare any specific variables to use InkWell?"
   Analysis & Application:
   - The AI clarified that **Yes**, specifically for a reusable component.
   - InkWell requires an 'onTap' callback to be non-null to show the ripple effect.
   - Therefore, we must declare a **'final VoidCallback onTap'** variable in the class and constructor. This allows the parent widget to pass the navigation logic (or any action) down to this card.
   - Application: Added `final VoidCallback onTap` and passed it to `InkWell(onTap: onTap)`.

   ---------------------------------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/

import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'star_rating.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("฿${product.price.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.green)),
                  StarRating(rating: product.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}