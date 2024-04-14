import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/adaptive/adaptive_row_column.dart';
import 'package:weeidl/screens/home/intro_section/cubit/dragon_cubit.dart';
import 'package:weeidl/screens/app_bar/widget/social_widget.dart';
import 'package:weeidl/screens/home/intro_section/widget/story_widget.dart';
import 'package:weeidl/screens/home/intro_section/widget/three_d_dragon/dragon.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "WEEIDL",
                      style: AppTextStyle.titleLight(AppColor.violet),
                    ),
                  ),
                ),
                if (!context.isMobile)
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialWidget(
                        image: 'linked_in.png',
                        url: 'https://www.linkedin.com/in/weeidl/',
                      ),
                      Gap(24),
                      SocialWidget(
                        image: 'github_icon.svg',
                        url: 'https://github.com/weeidl',
                      ),
                      Gap(24),
                      SocialWidget(
                        image: 'instagram.svg',
                        url: 'https://www.instagram.com/weeidl/',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<DragonCubit, DragonState>(
              builder: (context, state) {
                return Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Positioned(
                      right: context.isDesktop ? 0 : null,
                      bottom: context.isDesktop ? null : 0,
                      child: Dragon(
                        controller: state.controller,
                      ),
                    ),
                    Positioned(
                      left: context.isDesktop
                          ? MediaQuery.of(context).size.width * 0.15
                          : null,
                      child: StoryWidget(
                        controller: state.controller,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
