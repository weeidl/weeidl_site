import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_bar_state.dart';

class TabBarCubit extends Cubit<TabBarState> {
  TabBarCubit()
      : super(
          TabBarState(
            selectedTab: 0,
            controller: ScrollController(),
          ),
        );

  void selectedTab(int index) {
    emit(state.copyWith(selectedTab: index));
  }
}
