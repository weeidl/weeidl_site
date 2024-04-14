import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColor.white.withOpacity(0.1),
        ),
        const Gap(64),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: context.isDesktop
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Row(
                    children: [
                      weeidlText(),
                      const Spacer(),
                      links(),
                    ],
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: links(isDesktop: false),
                      ),
                      const Gap(32),
                      Expanded(
                        child: weeidlText(isDesktop: false),
                      ),
                    ],
                  ),
                ),
        ),
        const Gap(120),
      ],
    );
  }

  Widget weeidlText({bool isDesktop = true}) {
    return Column(
      crossAxisAlignment:
          isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          'WEEIDL',
          style: AppTextStyle.titleLight(AppColor.white),
        ),
        const Gap(16),
        AutoSizeText(
          'Thanks for stopping by ッ',
          style: AppTextStyle.body(AppColor.greyDarkText),
        ),
        const Spacer(),
        AutoSizeText(
          '© 2024 Artur Rustamov. All Rights Reserved.',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: AppTextStyle.body(AppColor.greyDarkText),
        ),
      ],
    );
  }

  Widget links({bool isDesktop = true}) {
    final crossAxisAlignment =
        isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Expanded(
              child: Text(
                'Links',
                style: AppTextStyle.body(AppColor.white),
              ),
            ),
            text('About', url: 'https://linkedin.com'),
            text('Work', url: 'https://linkedin.com'),
            text('Tech Stack', url: 'https://linkedin.com'),
            text('Contact', url: 'https://linkedin.com'),
          ],
        ),
        const Gap(80),
        Column(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Expanded(
              child: Text(
                'Elsewhere',
                style: AppTextStyle.body(AppColor.white),
              ),
            ),
            text('Twitter', url: 'https://linkedin.com'),
            text('LinkedIn', url: 'https://linkedin.com'),
            text('GitHub', url: 'https://linkedin.com'),
            text('Discord', url: 'https://linkedin.com'),
          ],
        ),
      ],
    );
  }

  Widget text(String name, {required String url}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: AutoSizeText(
          name,
          textAlign: TextAlign.start,
          style: AppTextStyle.body(AppColor.greyDarkText),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
