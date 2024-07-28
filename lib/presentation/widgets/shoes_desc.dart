import 'package:flutter/material.dart';

class ShoesDesciption extends StatelessWidget {
  final String title;
  final String description;

  const ShoesDesciption({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, height: 1.8),
          )
        ],
      ),
    );
  }
}
