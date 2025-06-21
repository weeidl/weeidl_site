import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:weeidl/extensions.dart';
import 'package:weeidl/screens/adaptive/adaptive_padding.dart';
import 'package:weeidl/themes/colors.dart';
import 'package:weeidl/themes/text_style.dart';

class GetToKnowCardWidget extends StatefulWidget {
  final Color color;
  final String title;
  final String description;
  final String image;
  final bool useColumn;
  final bool isTechStack;
  final AutoSizeGroup autoSizeGroup;

  const GetToKnowCardWidget({
    super.key,
    this.color = AppColor.grey3,
    required this.title,
    required this.description,
    required this.image,
    this.useColumn = false,
    this.isTechStack = false,
    required this.autoSizeGroup,
  });

  @override
  State<GetToKnowCardWidget> createState() => _GetToKnowCardWidgetState();
}

class _GetToKnowCardWidgetState extends State<GetToKnowCardWidget> {
  bool i = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/test');
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            i = true;
          });
        },
        onExit: (_) {
          setState(() {
            i = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              if (i)
                BoxShadow(
                  color: AppColor.black.withValues(alpha: 0.8),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: const Offset(0, 0),
                ),
            ],
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            final Widget textBlock = Padding(
              padding: AdaptivePadding.all(context, 32),
              child: Column(
                crossAxisAlignment: widget.useColumn
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    widget.title,
                    maxLines: 1,
                    style: AppTextStyle.headingMedium(AppColor.white),
                  ),
                  Gap(context.isMobile ? 8 : 16),
                  AutoSizeText(
                    widget.description,
                    group: widget.autoSizeGroup,
                    maxLines: 2,
                    textAlign: widget.useColumn ? null : TextAlign.center,
                    style: AppTextStyle.description(AppColor.grey),
                  ),
                  widget.useColumn
                      ? const Spacer()
                      : Gap(context.isMobile ? 16 : 32),
                  Text(
                    'GO TO PAGE  ->',
                    style: AppTextStyle.subtext(AppColor.greyDarkText),
                  ),
                ],
              ),
            );

            final children = [
              widget.useColumn ? Expanded(child: textBlock) : textBlock,
              Expanded(
                child: imageWidget(
                  context: context,
                  constraints: constraints,
                  useColumn: widget.useColumn,
                ),
              ),
            ];

            return Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: widget.useColumn
                    ? Row(children: children)
                    : Column(children: children),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget imageWidget({
    required BuildContext context,
    required bool useColumn,
    required BoxConstraints constraints,
  }) {
    if (useColumn) {
      return Padding(
        padding: widget.isTechStack
            ? EdgeInsets.zero
            : AdaptivePadding.only(
                context: context,
                top: 32,
                right: 32,
              ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: Image.asset(
            widget.image,
            alignment:
                widget.isTechStack ? Alignment.topLeft : Alignment.topCenter,
            fit: BoxFit.cover,
            height: constraints.maxHeight,
          ),
        ),
      );
    } else {
      return Image.asset(
        widget.image,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
        width: constraints.maxWidth,
      );
    }
  }
}
