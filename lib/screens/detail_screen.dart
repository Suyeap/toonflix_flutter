import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F6F3),
      appBar: AppBar(
        elevation: 0, // bar shadow
        backgroundColor: const Color(0xFFA2D9CE),
        foregroundColor: const Color(0xFF138D75),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              // Hero()로 컨테이너 감싸고 tag 동일 고유값 지정
              tag: id,
              child: Container(
                width: 220,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 13,
                      offset: const Offset(5, 5),
                      color: Colors.black.withOpacity(0.3),
                    )
                  ],
                ),
                child: Image.network(
                  thumb,
                  headers: const {
                    "user-agent":
                        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36"
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
