import 'package:flutter/material.dart';
import 'package:tooflix/models/webtoon_eposide_model.dart';
import 'package:tooflix/models/webtoon_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.webtoon,
    required this.eposode,
  });

  final WebtoonModel webtoon;
  final WebtoonEpisodeModel eposode;

  onButtonTab() async {
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=${webtoon.id}&no=${eposode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.shade400,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.1),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(eposode.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
