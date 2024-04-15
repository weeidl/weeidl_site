import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:weeidl/screens/app_bar/cubit/tab_bar_cubit.dart';
import 'package:weeidl/screens/footer/footer.dart';
import 'package:weeidl/screens/get_to_know_me/get_to_know_me.dart';
import 'package:weeidl/screens/home/intro_section/intro_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarCubit, TabBarState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: state.controller,
          child: Column(
            children: [
              const IntroSection(),
              GetToKnowMe(),
              const Gap(120),
              const Footer(),
              // const SelectedWork(),
            ],
          ),
        );
      },
    );
  }
}
