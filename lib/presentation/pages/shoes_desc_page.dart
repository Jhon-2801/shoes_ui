import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoes_ui/presentation/providers/shoes/shoes_provider.dart';
import 'package:shoes_ui/presentation/widgets/widgets.dart';

class ShoesDescPage extends StatelessWidget {
  const ShoesDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          const ShoesSizePreview(fullScreen: true),
          Positioned(
            top: 55,
            left: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              highlightElevation: 0,
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: 60,
              ),
            ),
          )
        ]),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const ShoesDesciption(
                title: 'Nike Air Max 720',
                description:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              const _MontoBuyNow(monto: 180),
              _ColorsYmore(),
              _BotonsLikeCart()
            ],
          ),
        ))
      ],
    ));
  }
}

class _BotonsLikeCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _CustomBotonLike(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          _CustomBotonLike(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _CustomBotonLike(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomBotonLike extends StatelessWidget {
  final Icon icon;

  const _CustomBotonLike({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  final int monto;

  const _MontoBuyNow({required this.monto});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Text(
            '\$$monto',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Bounce(
            delay: const Duration(seconds: 1),
            from: 8,
            child: const CustomBoton(text: 'Buy now', width: 120, heigth: 40),
          ),
        ],
      ),
    );
  }
}

class _ColorsYmore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child: _BotonColor(
                  color: Color(0xffC6D642),
                  index: 4,
                  img: 'assets/verde.png',
                ),
              ),
              Positioned(
                left: 60,
                child: _BotonColor(
                  color: Color(0xffFFAD29),
                  index: 3,
                  img: 'assets/amarillo.png',
                ),
              ),
              Positioned(
                left: 30,
                child: _BotonColor(
                  color: Color(0xff2099F1),
                  index: 2,
                  img: 'assets/azul.png',
                ),
              ),
              _BotonColor(
                color: Color(0xff364D56),
                index: 1,
                img: 'assets/negro.png',
              ),
            ],
          )),
          // Spacer(),
          CustomBoton(
            text: 'More reletad items',
            heigth: 30,
            width: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends ConsumerWidget {
  final Color color;
  final String img;
  final int index;
  const _BotonColor(
      {required this.color, required this.index, required this.img});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(shoesProvider.notifier).assetsImageChange(img);
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 100),
        duration: const Duration(milliseconds: 600),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
