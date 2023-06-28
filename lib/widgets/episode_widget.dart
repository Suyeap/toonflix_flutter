import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.e,
  });

  final WebtoonEpisodeModel e;

  onButtonTap() async {
    const url = "https://google.com";
    await launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFA2D9CE)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              e.title,
              style: const TextStyle(
                color: Color(0xFF138D75),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF138D75),
            ),
          ],
        ),
      ),
    );
  }
}
