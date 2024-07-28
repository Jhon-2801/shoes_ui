import 'package:flutter/material.dart';

class ShoesSizePreview extends StatelessWidget {
  const ShoesSizePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 420,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            _ZapatoConSombra(),
            _ZapatoTallas(),
          ],
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 230,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
                  ],
                ),
              ),
            ),
          ),
          const Image(image: AssetImage('assets/azul.png')),
        ],
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoBox(number: 7),
          _TallaZapatoBox(number: 7.5),
          _TallaZapatoBox(number: 8),
          _TallaZapatoBox(number: 8.5),
          _TallaZapatoBox(number: 9),
          _TallaZapatoBox(number: 9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoBox extends StatelessWidget {
  final double number;

  const _TallaZapatoBox({required this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: number == 9 ? const Color(0xffEAA14E) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (number == 9)
            const BoxShadow(
              color: Color(0xffF1A23A),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
        ],
      ),
      child: Text(
        number.toString().replaceAll('.0', ''),
        style: TextStyle(
          color: number == 9 ? Colors.white : const Color(0xffEAA14E),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
