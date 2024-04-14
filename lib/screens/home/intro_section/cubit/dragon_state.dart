part of 'dragon_cubit.dart';

class DragonState {
  final O3DController controller;

  const DragonState({
    required this.controller,
  });

  DragonState copyWith({
    O3DController? controller,
  }) {
    return DragonState(
      controller: controller ?? this.controller,
    );
  }
}
