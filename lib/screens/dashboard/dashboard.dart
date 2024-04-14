import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:weeidl/screens/app_bar/cubit/tab_bar_cubit.dart';
import 'package:weeidl/screens/app_bar/weeidl_app_bar.dart';
import 'package:weeidl/screens/coming_soon/coming_soon_screen.dart';
import 'package:weeidl/screens/home/home_screen.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget tabs(int tab, ScrollController controller) {
      switch (tab) {
        case 0:
          return HomeScreen(
            controller: controller,
          );
        case 1:
          return const ComingSoonScreen();
        case 2:
          return const ComingSoonScreen();
        default:
          return const ComingSoonScreen();
      }
    }

    return Scaffold(
      backgroundColor: AppColor.black,
      body: BlocBuilder<TabBarCubit, TabBarState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/background.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              tabs(state.selectedTab, state.controller),
              WeeidlAppBar(
                controller: state.controller,
                selectedIndex: state.selectedTab,
                onIndexChanged: (index) =>
                    context.read<TabBarCubit>().selectedTab(index),
              ),
            ],
          );
        },
      ),
    );
  }
}
