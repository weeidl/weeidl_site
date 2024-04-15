import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weeidl/themes/colors.dart';

class SocialWidget extends StatefulWidget {
  final String image;
  final String url;

  const SocialWidget({
    super.key,
    required this.image,
    required this.url,
  });

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  bool isSelected = false;

  bool isSvg(String fileName) {
    return fileName.toLowerCase().endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = 'assets/social/${widget.image}';
    final color = isSelected ? AppColor.violet : null;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          final Uri link = Uri.parse(widget.url);
          if (!await launchUrl(link)) {
            throw Exception('Could not launch ${widget.url}');
          }
        },
        child: isSvg(widget.image)
            ? SvgPicture.asset(imagePath,
                colorFilter: ColorFilter.mode(
                  color ?? AppColor.white,
                  BlendMode.srcIn,
                ),
                width: 24)
            : Image.asset(imagePath, color: color, width: 24),
      ),
    );
  }
}
