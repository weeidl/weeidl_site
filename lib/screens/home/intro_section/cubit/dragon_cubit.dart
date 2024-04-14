import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o3d/o3d.dart';
import 'package:weeidl/screens/home/intro_section/widget/three_d_dragon/animation.dart';

part 'dragon_state.dart';

class DragonCubit extends Cubit<DragonState> {
  DragonCubit()
      : super(
          DragonState(
            controller: O3DController(),
          ),
        );

  void yes() {
    state.controller.animationName = Animations.animationYes;
    fly();
  }

  void no() {
    state.controller.animationName = Animations.animationNo;
    fly();
  }

  void fly() {
    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      state.controller.animationName = Animations.animationFlying;
    });
  }
}
