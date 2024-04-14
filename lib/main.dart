import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeidl/screens/app_bar/cubit/tab_bar_cubit.dart';
import 'package:weeidl/screens/dashboard/dashboard.dart';
import 'package:weeidl/screens/home/intro_section/cubit/dragon_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabBarCubit()),
        BlocProvider(create: (context) => DragonCubit()),
      ],
      child: MaterialApp(
        home: Dashboard(),
      ),
    );
  }
}
