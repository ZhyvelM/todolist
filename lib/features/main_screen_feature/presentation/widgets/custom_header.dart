import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todolist/ui_kit/app_text_styles.dart';
import 'package:todolist/ui_kit/icons/app_icons.dart';
import 'package:todolist/ui_kit/palette.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.title,
    required this.maxHeight,
    required this.minHeight,
    required this.subtitle,
    required this.onVisibilityIconTap,
    required this.visibility,
  });

  final String title;
  final String subtitle;
  final double maxHeight;
  final double minHeight;

  final bool visibility;
  final Function(bool) onVisibilityIconTap;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    final textStyles = AppTextStyle();
    return LayoutBuilder(
      builder: (context, constraints) {
        final ratio = (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
        return Container(
          decoration: DecorationTween(
            begin: BoxDecoration(color: palette.backPrimary),
            end: BoxDecoration(
              color: palette.backPrimary,
              boxShadow: [
                BoxShadow(color: Color(0x33000000), offset: Offset(0, 1), blurRadius: 10, spreadRadius: 0),
                BoxShadow(color: Color(0x1f000000), offset: Offset(0, 4), blurRadius: 5, spreadRadius: 0),
              ],
            ),
          ).lerp(pow(1 - ratio, 20).toDouble()),
          padding: EdgeInsets.only(left: 16 + 44 * ratio),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title, style: TextStyleTween(begin: textStyles.title, end: textStyles.largeTitle).lerp(ratio)),
                    SizedBox(height: 16 - 12 * ratio),
                    SizedBox(
                      height: 24 * ratio,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(subtitle, style: textStyles.body.copyWith(color: palette.labelTertiary)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => onVisibilityIconTap(!visibility),
                child: Padding(
                  padding: EdgeInsets.only(right: 18 + 6 * ratio, bottom: 16 - 16 * ratio),
                  child: Icon(visibility ? AppIcons.visibility : AppIcons.visibilityOff, color: palette.blue),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
