import 'package:flutter/material.dart';
import 'package:todolist/utils/extensions.dart';

abstract class Palette {
  static Palette of(BuildContext context) => context.isDarkMode ? AppDarkTheme() : AppLightTheme();
  late Color separator;
  late Color overlay;
  late Color labelPrimary;
  late Color labelSecondary;
  late Color labelTertiary;
  late Color labelDisabled;
  late Color red;
  late Color green;
  late Color blue;
  late Color gray;
  late Color grayLight;
  late Color white;
  late Color backPrimary;
  late Color backSecondary;
  late Color backElevated;
  late Color transparent;
}

class AppLightTheme implements Palette {
  @override
  Color backElevated = const Color(0xffffffff);

  @override
  Color backPrimary = const Color(0xfff7f6f2);

  @override
  Color backSecondary = const Color(0xffffffff);

  @override
  Color blue = const Color(0xff007aff);

  @override
  Color gray = const Color(0xff8e8e93);

  @override
  Color grayLight = const Color(0xffd1d1d6);

  @override
  Color green = const Color(0xff34c759);

  @override
  Color labelDisabled = const Color(0x26000000);

  @override
  Color labelPrimary = const Color(0xff000000);

  @override
  Color labelSecondary = const Color(0x99000000);

  @override
  Color labelTertiary = const Color(0x4d000000);

  @override
  Color overlay = const Color(0x0f000000);

  @override
  Color red = const Color(0xffff3b30);
  @override
  Color separator = const Color(0x33000000);

  @override
  Color white = const Color(0xffffffff);

  @override
  Color transparent = Colors.transparent;
}

class AppDarkTheme implements Palette {
  @override
  Color backElevated = const Color(0xff3c3c3f);

  @override
  Color backPrimary = const Color(0xff161618);

  @override
  Color backSecondary = const Color(0xff252528);

  @override
  Color blue = const Color(0xff0a84ff);

  @override
  Color gray = const Color(0xff8e8e93);

  @override
  Color grayLight = const Color(0xff48484a);

  @override
  Color green = const Color(0xff32d74b);

  @override
  Color labelDisabled = const Color(0x26ffffff);

  @override
  Color labelPrimary = const Color(0xffffffff);

  @override
  Color labelSecondary = const Color(0x99FFFFFF);

  @override
  Color labelTertiary = const Color(0x66FFFFFF);

  @override
  Color overlay = const Color(0x52FFFFFF);

  @override
  Color red = const Color(0xffff453a);
  @override
  Color separator = const Color(0xccffffff);

  @override
  Color white = const Color(0xffffffff);

  @override
  Color transparent = Colors.transparent;
}
