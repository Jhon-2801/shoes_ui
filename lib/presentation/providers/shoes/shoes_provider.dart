import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'shoes_provider.g.dart';

@riverpod
class Shoes extends _$Shoes {
  @override
  ShoesState build() {
    return ShoesState(
      assetImage: 'assets/azul.png',
      talla: 9.0,
    );
  }

  void tallaChange(double talla) {
    state = state.copyWith(talla: talla);
  }

  void assetsImageChange(String img) {
    state = state.copyWith(assetImage: img);
  }
}

class ShoesState {
  final double talla;
  final String assetImage;
  ShoesState({
    required this.talla,
    required this.assetImage,
  });
  ShoesState copyWith({
    double? talla,
    String? assetImage,
  }) {
    return ShoesState(
      talla: talla ?? this.talla,
      assetImage: assetImage ?? this.assetImage,
    );
  }
}
