import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  final String textName;
  final String? fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFont({
    super.key,
    required this.textName,
    this.fontFamily,
    this.fontSize = 24.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(8) ,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        textAlign: TextAlign.center,
        textName,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
