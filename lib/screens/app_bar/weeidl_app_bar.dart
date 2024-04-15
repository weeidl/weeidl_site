import 'package:flutter/material.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/app_bar/screen/tab_bar.dart';

class WeeidlAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int index) onIndexChanged;
  final ScrollController controller;

  const WeeidlAppBar({
    super.key,
    required this.onIndexChanged,
    required this.selectedIndex,
    required this.controller,
  });

  @override
  State<WeeidlAppBar> createState() => _WeeidlAppBarState();
}

class _WeeidlAppBarState extends State<WeeidlAppBar> {
  bool isScrolled = false;

  @override
  void initState() {
    // widget.controller.addListener(() {
    //   if (widget.controller.offset >= 50) {
    //     setState(() {
    //       isScrolled = true;
    //     });
    //   } else {
    //     setState(() {
    //       isScrolled = false;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTabletSize = !isScrolled || !context.isTablet ? 0.5 : 0.8;
    final widthTapBar = width * (context.isMobile ? 1 : isTabletSize);

    Widget tapBar = TapBar(
      titleOne: 'Home',
      titleTwo: 'About',
      titleThree: 'Projects',
      titleFour: 'Contact',
      selectedIndex: widget.selectedIndex,
      onIndexChanged: widget.onIndexChanged,
    );

    return Padding(
      padding: context.isMobile
          ? const EdgeInsets.all(24)
          : const EdgeInsets.only(top: 24),
      child: Align(
        alignment:
            context.isMobile ? Alignment.bottomCenter : Alignment.topCenter,
        child: SizedBox(
          height: 64,
          child: SizedBox(
            width: widthTapBar,
            child: Center(child: tapBar),
          ),
        ),
      ),
    );
  }
}
