import 'package:flutter/material.dart';
import 'package:duangkamon_widgets_exercises/components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pet App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,// ให้เนื้อหาอยู่ตรงกลาง
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCard(
                  name: 'Bird',
                  imgURL:
                      'https://i.pinimg.com/1200x/6d/64/6f/6d646fd76d65cb3711579435c3885972.jpg',
                ),
              ),
              Expanded(
                child: PetCard(
                  name: 'Dog',
                  imgURL:
                      'https://i.pinimg.com/1200x/98/b2/02/98b202a792b32d5f11a267865203e0cd.jpg',
                ),
              ),
            ],
          ),
          const SizedBox(height: 200), //เพิ่มช่วงว่างระหว่างแถวแรกและแถวสุดท้าย
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PetCard(
                  name: 'Cat',
                  imgURL:
                      'https://i.pinimg.com/736x/d6/f2/38/d6f238dcf1e585ef7bc421a18cc7538f.jpg',
                ),
              ),
              Expanded(
                child: PetCard(
                  name: 'Rabbit',
                  imgURL:
                      'https://i.pinimg.com/736x/ad/72/32/ad72321f36824d6a94e485b33569e456.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
