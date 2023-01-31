import 'package:flutter/material.dart';
import 'package:tooflix/screens/cartoon_card.dart';
import 'package:tooflix/screens/detail_screen.dart';

import '../models/webtoon_model.dart';

class Webtoon extends StatelessWidget {
  const Webtoon({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(webtoonModel: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(children: [
        Hero(tag: webtoon.id, child: CartoonCard(webtoon: webtoon)),
        Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        )
      ]),
    );
  }
}
