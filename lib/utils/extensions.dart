import 'package:flutter/material.dart';
import 'package:todolist/utils/enums.dart';

extension AppContext on BuildContext {
  get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
