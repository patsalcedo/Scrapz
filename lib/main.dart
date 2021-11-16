import 'package:flutter/material.dart';
import 'package:scrapz/themes/scrapz_theme.dart';
import 'package:provider/provider.dart';
import 'package:scrapz/provider/card_provider.dart';
import 'themes/scrapz_theme_cl.dart';
import 'hub.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final theme = ScrapzTheme.light();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        title: 'Scrapz',
        home: const Hub(),
        theme: _kScrapzTheme,
      ),
    );
  }
}

final ThemeData _kScrapzTheme = _buildScrapzTheme();

ThemeData _buildScrapzTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: scrapzOrange,
      onPrimary: scrapzOrange,
      secondary: scrapzYellow,
      error: scrapzErrorRed,
    ),
  );
}