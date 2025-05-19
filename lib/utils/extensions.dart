import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
