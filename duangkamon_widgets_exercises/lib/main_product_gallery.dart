/* Product Gallery App - Main Entry Point
   The root widget of the application that sets up the global theme and renders the home screen.

   This file is responsible for:
   1. Initializing the Flutter app with Material Design 3.
   2. Defining both Light and Dark themes for better user experience.
   3. Displaying the "Product Gallery" as the home screen using a responsive Grid Layout.

   ---------------------------------------------------------------------------
   AI Documentation
   ---------------------------------------------------------------------------
   AI Tool: I don't use any AI tools.

   @author Duangkamon Chaithongsri
   @studentID 663040115-1
   @date 2026-01-27
*/

import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'components/product_card.dart';
import 'screens/product_detail.dart';

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
      home: const MainProductGallery(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MainProductGallery extends StatefulWidget {
  const MainProductGallery({super.key});
  @override
  _MainProductGalleryState createState() => _MainProductGalleryState();
}


class _MainProductGalleryState extends State<MainProductGallery> {
  static const List<ProductModel> products = [
    ProductModel(id: 1, name: "Book", price: 299.0, imageUrl: "assets/images/products/book.jpg", description: "Immerse yourself in a captivating journey with this beautifully bound hardcover edition. Featuring high-quality, acid-free paper and a sleek, minimalist cover design, it is built to last a lifetime on your shelf. Whether you’re diving into a deep narrative or seeking expert knowledge, the clear typography ensures a comfortable reading experience for hours on end. A perfect gift for bibliophiles and curious minds alike.", rating: 4.5),
    ProductModel(id: 2, name: "Headphone", price: 450.0, imageUrl: "assets/images/products/headphone.jpg", description: "Experience studio-quality audio with these premium over-ear headphones. Engineered with advanced active noise cancellation (ANC) and high-fidelity drivers, they deliver crisp highs and deep, resonant bass. The ergonomic memory foam ear cushions provide all-day comfort, while the 40-hour battery life ensures your music never stops. Equipped with multipoint Bluetooth pairing to switch seamlessly between your devices.", rating: 3.5),
    ProductModel(id: 3, name: "Keyboard", price: 199.0, imageUrl: "assets/images/products/keyboard.jpg", description: "Elevate your typing experience with this high-performance mechanical keyboard. Featuring ultra-responsive switches and customizable RGB backlighting, it’s designed for both precision gaming and heavy-duty office work. The durable, aircraft-grade aluminum frame offers a solid feel, while the programmable macro keys and dedicated media controls put total customization at your fingertips.", rating: 4.0),
    ProductModel(id: 4, name: "Laptop", price: 5000.0, imageUrl: "assets/images/products/laptop.jpg", description: "Power through your most demanding tasks with this ultra-slim, high-performance laptop. Packed with the latest multi-core processor and a stunning 4K color-accurate display, it’s a powerhouse for creators and professionals. The lightweight magnesium alloy chassis makes it highly portable, while the advanced cooling system and long-lasting battery ensure peak performance wherever your work takes you.", rating: 4.3),
    ProductModel(id: 5, name: "Mouse", price: 259.5, imageUrl: "assets/images/products/mouse.jpg", description: "Achieve ultimate precision with this ergonomic wireless mouse. Designed with a high-accuracy optical sensor and customizable DPI settings, it offers pixel-perfect tracking for design and gaming. The contoured shape reduces wrist strain during long sessions, and the silent-click buttons provide a quiet yet tactile response. Features a rechargeable battery that lasts up to 70 days on a single charge.", rating: 4.2),
    ProductModel(id: 6, name: "Speaker", price: 390.0, imageUrl: 'assets/images/products/speaker.jpg', description: "Compact Bluetooth speaker with powerful 360-degree immersive sound. The rugged, waterproof IPX7 rating makes it the perfect companion for pool parties, beach trips, and outdoor adventures. Enjoy up to 12 hours of continuous playtime and a built-in noise-canceling microphone for crystal-clear hands-free calls. Pair two units together wirelessly to create a true cinematic stereo soundstage.", rating: 3.8),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Gallery by 663040115-1")),


      //จากโค้ดที่อาจารย์ให้มาใน Document
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetail(product: products[index])),
            );
          },
        ),
      ),
    );
  }
}