/* The main screen widget 'PetsScreen' for the Pet App.
   It displays a dashboard of pet profiles arranged in a 2x2 grid layout.
   The layout structure strictly : Scaffold -> Center -> Column.
   It uses 'MainAxisAlignment.spaceAround' to evenly distribute the rows vertically.

  AI Documentation
  AI Tool: Gemini 3 Pro
  Prompt 1: "Does this code meet the requirements? (Checking structure and spacing)"
  Prompt answer analysis and application:
  - The AI reviewed the code against the specifications and pointed out two missing elements:
    1. The 'Column' was not wrapped in a 'Center' widget as required by the 'body with Center' rule.
    2. The vertical alignment used 'MainAxisAlignment.center' with a fixed 'SizedBox', whereas the requirement specified 'MainAxisAlignment.spaceAround'.
  - I applied the fixes by wrapping the Column with Center, changing the alignment to 'spaceAround', and removing the unnecessary 'SizedBox'.

  Prompt 2: "Why should I use a relative import like '../components/pet_card.dart'?"
  Prompt answer analysis and application:
  - The AI explained that while package imports work, using relative imports is often preferred for files within the same feature or module to maintain cleaner dependency tracking.
  - I updated the import statement to match the specific requirement: "Import: import '../components/pet_card.dart'".


  @author Duangkamon Chaithongsri
  @version 1.0.0
  @date 2026-01-06
*/

import 'package:flutter/material.dart';
import  '../components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pet App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCard(
                    'Bird',
                    'https://i.pinimg.com/1200x/6d/64/6f/6d646fd76d65cb3711579435c3885972.jpg',
                  ),
                ),
                Expanded(
                  child: PetCard(
                    'Dog',
                    'https://i.pinimg.com/1200x/98/b2/02/98b202a792b32d5f11a267865203e0cd.jpg',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PetCard(
                    'Cat',
                    'https://i.pinimg.com/736x/d6/f2/38/d6f238dcf1e585ef7bc421a18cc7538f.jpg',
                  ),
                ),
                Expanded(
                  child: PetCard(
                    'Rabbit',
                    'https://i.pinimg.com/736x/ad/72/32/ad72321f36824d6a94e485b33569e456.jpg',
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
