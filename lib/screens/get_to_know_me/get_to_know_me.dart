import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/get_to_know_me/widget/get_to_know_card_widget.dart';
import 'package:weeidl/screens/utils/window/window_widget.dart';

class GetToKnowMe extends StatelessWidget {
  GetToKnowMe({super.key});

  final AutoSizeGroup autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: WindowWidget(
        title: 'Get to know me',
        child: adaptiveGetToKnowMe(context),
      ),
    );
  }

  Widget adaptiveGetToKnowMe(BuildContext context) {
    if (context.isDesktop) {
      return Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                bookshelf(context),
                notebook(context),
              ],
            ),
          ),
          techStack(context),
        ],
      );
    } else {
      return Column(
        children: [
          bookshelf(context),
          notebook(context),
          techStack(context),
        ],
      );
    }
  }

  Widget bookshelf(BuildContext context) {
    return Expanded(
      child: GetToKnowCardWidget(
        title: 'Bookshelf',
        description: 'Books and pieces of wisdom I’ve enjoyed reading',
        image: 'assets/mac_window/bookshelf_desktop.png',
        useColumn: true,
        autoSizeGroup: autoSizeGroup,
      ),
    );
  }

  Widget notebook(BuildContext context) {
    return Expanded(
      child: GetToKnowCardWidget(
        title: 'Notebook',
        description: 'My thoughts, insights, and reflections',
        image: 'assets/mac_window/desk_notes.png',
        useColumn: true,
        autoSizeGroup: autoSizeGroup,
      ),
    );
  }

  Widget techStack(BuildContext context) {
    return Expanded(
      flex: context.isDesktop ? 8 : 1,
      child: GetToKnowCardWidget(
        title: 'Tech Stack',
        description: 'The dev tools, apps, devices, and games I use and play.',
        image: context.isDesktop
            ? 'assets/mac_window/tech_stack_desk.png'
            : 'assets/mac_window/tech_stack_mobile.png',
        autoSizeGroup: autoSizeGroup,
        useColumn: context.isDesktop ? false : true,
        isTechStack: true,
      ),
    );
  }
}
