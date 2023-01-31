import 'package:flutter/material.dart';
import 'package:tooflix/models/webtoon_model.dart';

class CartoonCard extends StatelessWidget {
  const CartoonCard({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          blurRadius: 15,
          offset: const Offset(10, 10),
          color: Colors.black.withOpacity(0.3),
        )
      ]),
      child: Image.network(webtoon.thumb),
    );
  }
}
