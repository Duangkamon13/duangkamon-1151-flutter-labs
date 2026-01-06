/* The main screen widget 'PetsGalleryScreen' displaying a 2x2 grid of pet cards.
   It uses a Column containing two Rows, with each PetCard wrapped in an Expanded widget
   to ensure equal distribution of space within the layout.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt1: "How do I make the content go to the center? Why does mainAxisAlignment.center not work with Expanded?"
  Prompt answer analysis and application:
  - The AI explained that using 'Expanded' inside a Column can force children to take up all available vertical space, preventing 'MainAxisAlignment.center' from working effectively in some contexts.
  - It recommended wrapping the entire main Column with a 'Center' widget to ensure the grid floats in the middle of the screen.
  - It also suggested wrapping individual PetCardWithModel widgets with 'Center' inside the 'Expanded' widgets to prevent them from stretching unnaturally.
  - I applied these layout fixes to achieve the desired centered 2x2 grid appearance.

 Prompt 2: "How do I call PetModel to input data like names?"
  Prompt answer analysis and application:
  - The AI explained that 'PetCardWithModel' requires an instance of the 'PetModel' class passed to its 'pet' parameter.
  - It demonstrated how to instantiate the model directly inside the widget call: PetModel(name: '...', imageURL: '...').
  - I applied this by creating specific PetModel objects for the Bird, Dog, Cat, and Rabbit, passing their unique data to each card.

  VERIFICATION:
  Ran the app on an emulator. The 2x2 grid is now perfectly centered on the screen, and the cards maintain their correct aspect ratio without distortion.

  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-05
*/

import 'package:flutter/material.dart';
import '../components/pet_card_with_model.dart';
import '../models/pet_model.dart';

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet Gallery')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PetCardWithModel(
                    pet: PetModel(
                      name: 'Bird',
                      imageURL:
                          'https://i.pinimg.com/1200x/6d/64/6f/6d646fd76d65cb3711579435c3885972.jpg',
                    ),
                  ),
                ),
                Expanded(
                  child: PetCardWithModel(
                    pet: PetModel(
                      name: 'Dog',
                      imageURL:
                          'https://i.pinimg.com/1200x/98/b2/02/98b202a792b32d5f11a267865203e0cd.jpg',
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PetCardWithModel(
                    pet: PetModel(
                      name: 'Cat',
                      imageURL:
                          'https://i.pinimg.com/736x/d6/f2/38/d6f238dcf1e585ef7bc421a18cc7538f.jpg',
                      textColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: PetCardWithModel(
                    pet: PetModel(
                      name: 'Rabbit',
                      imageURL:
                          'https://i.pinimg.com/736x/ad/72/32/ad72321f36824d6a94e485b33569e456.jpg',
                      backgroundColor: Colors.amber,
                      textColor: Colors.black,
                    ),
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
