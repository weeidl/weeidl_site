import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weeidl/screens/footer/footer.dart';
import 'package:weeidl/screens/get_to_know_me/get_to_know_me.dart';
import 'package:weeidl/screens/home/intro_section/intro_section.dart';
import 'package:weeidl/screens/home/selected_work/selected_work.dart';

class HomeScreen extends StatelessWidget {
  final ScrollController controller;
  const HomeScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          const IntroSection(),
          GetToKnowMe(),
          Gap(120),
          Footer(),
          // const SelectedWork(),
        ],
      ),
    );
  }
}
