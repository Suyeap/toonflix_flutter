import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);
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
    );
  }
}
