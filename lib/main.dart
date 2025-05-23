import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todolist/features/add_edit_screen_feature/presentation/add_edit_screen.dart';
import 'package:todolist/ui_kit/palette.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);
    return MaterialApp(
      title: 'To Do List',
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en', ''), const Locale('ru', '')],
    );
  }
}
