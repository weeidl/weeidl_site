part of 'tab_bar_cubit.dart';

class TabBarState {
  final int selectedTab;
  final ScrollController controller;

  const TabBarState({
    required this.selectedTab,
    required this.controller,
  });

  TabBarState copyWith({
    int? selectedTab,
    ScrollController? controller,
  }) {
    return TabBarState(
      selectedTab: selectedTab ?? this.selectedTab,
      controller: controller ?? this.controller,
    );
  }
}
