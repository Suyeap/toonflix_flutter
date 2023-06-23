import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}); // remove const bcus we have Future class

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6F3),
      appBar: AppBar(
        elevation: 0, // bar shadow
        backgroundColor: const Color(0xFFA2D9CE),
        foregroundColor: const Color(0xFF138D75),
        title: const Text(
          'Today\'s toonz',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text('data');
            }
            return const Text('Loading');
          }),
    );
  }
}
