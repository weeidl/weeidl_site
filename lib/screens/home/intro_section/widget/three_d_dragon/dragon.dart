import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/home/intro_section/widget/three_d_dragon/animation.dart';

class Dragon extends StatelessWidget {
  final O3DController controller;
  const Dragon({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (context.isDesktop ? 0.5 : 1),
      height: MediaQuery.of(context).size.height * 0.4,
      child: O3D(
        disableTap: true,
        disableZoom: true,
        disablePan: true,
        debugLogging: true,
        autoPlay: true,
        animationName: Animations.animationFlying,
        autoRotate: false,
        cameraControls: false,
        cameraOrbit: CameraOrbit(10, 90, 6),
        controller: controller,
        src: 'assets/dragon.glb',
      ),
    );
  }
}
