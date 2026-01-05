import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imgURL;
  const PetCard({super.key, required this.name, required this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            child: Image.network(
              imgURL,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.0)),
            child: Container(
              alignment: Alignment.center,
              color: Colors.pink,
              width: 120,
              height: 50,
              child: Text(
                '$name',
                style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
