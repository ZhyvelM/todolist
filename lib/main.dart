import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todolist/features/main_screen_feature/presentation/main_screen.dart';
import 'package:todolist/generated/l10n.dart';
import 'package:todolist/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocale.delegate.supportedLocales,
      home: MainScreen(),
    );
  }
}
