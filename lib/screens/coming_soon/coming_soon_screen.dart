import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.black,
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AutoSizeText(
                          'Coming Soon'.toUpperCase(),
                          maxLines: 1,
                          style: AppTextStyle.titleLarge(AppColor.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Lottie.asset('assets/astronaut.json'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/background.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
