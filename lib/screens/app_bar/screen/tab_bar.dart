import 'package:flutter/material.dart';
import 'package:weeidl/screens/app_bar/widget/app_bar_widget.dart';

class TapBar extends StatefulWidget {
  final int selectedIndex;
  final String titleOne;
  final String titleTwo;
  final String titleThree;
  final String titleFour;
  final Function(int index) onIndexChanged;

  const TapBar({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.titleThree,
    required this.titleFour,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  TapBarState createState() => TapBarState();
}

class TapBarState extends State<TapBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            color: const Color(0xFF101010),
            border: Border.all(
              color: const Color(0xFF232323),
              width: 1.0,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                  alignment: Alignment((widget.selectedIndex * 2 - 3) / 3, 0.0),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    width: constraints.maxWidth / 4,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      color: const Color(0xFF1d1d1d),
                      border: Border.all(
                        color: const Color(0xFF232323),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBarWidget(
                    text: widget.titleOne,
                    isSelected: widget.selectedIndex == 0,
                    onTap: () => widget.onIndexChanged(0),
                  ),
                  AppBarWidget(
                    text: widget.titleTwo,
                    isSelected: widget.selectedIndex == 1,
                    onTap: () => widget.onIndexChanged(1),
                  ),
                  AppBarWidget(
                    text: widget.titleThree,
                    isSelected: widget.selectedIndex == 2,
                    onTap: () => widget.onIndexChanged(2),
                  ),
                  AppBarWidget(
                    text: widget.titleFour,
                    isSelected: widget.selectedIndex == 3,
                    onTap: () => widget.onIndexChanged(3),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
