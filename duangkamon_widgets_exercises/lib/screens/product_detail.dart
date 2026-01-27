/* Product Detail Screen
   Displays detailed information about a specific product.

   This screen receives a 'ProductModel' object and renders its properties, including:
   - Product Image (Full width)
   - Product Name and Formatted Price (with 2 decimal places)
   - Star Rating component
   - Text Description
   - "Add to Cart" button with an icon and click feedback (SnackBar)
   ---------------------------------------------------------------------------
   AI Documentation
   ---------------------------------------------------------------------------
   AI Tool: Gemini 3 Pro

   [Question 1]
   Prompt: "Which widget should I use to create a button, and how do I add an action when it is pressed?"
   Analysis & Application:
   - The AI recommended using **'ElevatedButton'** for the main action.
   - It explained that the **'onPressed'** property handles the click event.
   - Application: Implemented the "Add to Cart" button that triggers a SnackBar when clicked.

   [Question 2]
   Prompt: "How can I convert a double value to a String with exactly 2 decimal places?"
   Analysis & Application:
   - The AI suggested using **'.toStringAsFixed(2)'** on the double variable.
   - Application: Applied `product.price.toStringAsFixed(2)` to format the price (e.g., 299.00).

   [Question 3]
   Prompt: "How can I find a shopping cart icon and place it inside the button?"
   Analysis & Application:
   - The AI identified **'Icons.shopping_cart'** as the correct icon data.
   - It suggested using the **'ElevatedButton.icon'** constructor instead of the standard 'ElevatedButton' to easily combine an icon and a label.
   - Application: Refactored the button to use `ElevatedButton.icon(icon: Icon(Icons.shopping_cart), ...)` for a better UI.

   ---------------------------------------------------------------------------
  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-27
*/
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../components/star_rating.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.asset(product.imageUrl, height: 250),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  "฿${product.price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    StarRating(rating: product.rating),
                    Text(" ${product.rating.toString()}/5.0"),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.grey, thickness: 1, height: 10),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(product.description),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to Cart!")),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
