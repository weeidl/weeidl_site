import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weeidl/screens/app_bar/cubit/tab_bar_cubit.dart';
import 'package:weeidl/screens/app_bar/weeidl_app_bar.dart';
import 'package:weeidl/themes/colors.dart';

class Dashboard extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Dashboard({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
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
              navigationShell,
              WeeidlAppBar(
                controller: state.controller,
                selectedIndex: navigationShell.currentIndex,
                onIndexChanged: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
