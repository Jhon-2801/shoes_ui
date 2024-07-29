import 'package:flutter/material.dart';

class CustomBoton extends StatelessWidget {
  final String text;
  final double heigth;
  final double width;
  final Color color;
  const CustomBoton(
      {super.key,
      required this.text,
      this.heigth = 50,
      this.width = 150,
      this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
