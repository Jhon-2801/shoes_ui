import 'package:flutter/material.dart';
import 'package:shoes_ui/presentation/widgets/widgets.dart';

class AgregarCarritoBotton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBotton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.08),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$monto',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const CustomBoton(text: 'Add to cart'),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
