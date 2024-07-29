import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_ui/presentation/pages/pages.dart';
import 'package:shoes_ui/presentation/providers/shoes/shoes_provider.dart';

class ShoesSizePreview extends ConsumerWidget {
  final bool fullScreen;
  const ShoesSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShoesDescPage()),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 30 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 400 : 420,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              !fullScreen ? _ZapatoTallas() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesState = ref.watch(shoesProvider);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 230,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
                  ],
                ),
              ),
            ),
          ),
          Image(image: AssetImage(shoesState.assetImage)),
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

class _TallaZapatoBox extends ConsumerWidget {
  final double number;

  const _TallaZapatoBox({required this.number});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoesState = ref.watch(shoesProvider);
    return GestureDetector(
      onTap: () {
        ref.read(shoesProvider.notifier).tallaChange(number);
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: number == shoesState.talla
              ? const Color(0xffEAA14E)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (number == shoesState.talla)
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
            color: number == shoesState.talla
                ? Colors.white
                : const Color(0xffEAA14E),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
