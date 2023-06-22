import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6F3),
      appBar: AppBar(
        elevation: 0, // bar shadow
        backgroundColor: const Color(0xFFA2D9CE),
        foregroundColor: const Color(0xFF138D75),
        title: const Text(
          'Today\'s 툰s',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
