import 'package:flutter/material.dart';
import 'package:myportfolio/pages/home_screen.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  bool _isDarkMode = false;
  Locale _locale = const Locale('fr');

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'fr' ? const Locale('en') : const Locale('fr');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Portfolio',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: _locale,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
        toggleLanguage: _toggleLanguage,
        locale: _locale,
      ),
    );
  }
}
