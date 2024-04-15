import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weeidl/screens/app_bar/cubit/tab_bar_cubit.dart';
import 'package:weeidl/screens/coming_soon/coming_soon_screen.dart';
import 'package:weeidl/screens/dashboard/dashboard.dart';
import 'package:weeidl/screens/home/home_screen.dart';
import 'package:weeidl/screens/home/intro_section/cubit/dragon_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => Dashboard(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                path: '/test',
                builder: (context, state) => const ComingSoonScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/about',
                builder: (context, state) => const ComingSoonScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/projects',
                builder: (context, state) => const ComingSoonScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/contact',
                builder: (context, state) => const ComingSoonScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabBarCubit()),
        BlocProvider(create: (context) => DragonCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
      ),
    );
  }
}
