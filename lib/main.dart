import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screem.dart';

void main() {
  runApp(const App());
}

// widget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color(0xFF80bddc),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Color(0xFF43545c)),
          ),
          cardColor: const Color(0xFFF4EDDB),
          secondaryHeaderColor: const Color(0xFFbcdced),
        ),
        home: const HomeScreen());
  }
}
