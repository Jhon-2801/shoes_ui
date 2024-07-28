import 'package:flutter/material.dart';
import 'package:shoes_ui/presentation/widgets/widgets.dart';
// import 'package:shoes_ui/presentation/widgets/widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppbar(text: 'For you'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoesSizePreview(),
                  ShoesDesciption(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  )
                ],
              ),
            ),
          ),
          AgregarCarritoBotton(monto: 180.0),
        ],
      ),
    );
  }
}
