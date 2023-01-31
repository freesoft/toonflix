import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tooflix/models/webtoon_detail_model.dart';
import 'package:tooflix/models/webtoon_eposide_model.dart';
import 'package:tooflix/models/webtoon_model.dart';
import 'package:tooflix/screens/cartoon_card.dart';
import 'package:tooflix/services/api_service.dart';
import 'package:tooflix/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.webtoonModel});
  final WebtoonModel webtoonModel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList("likedToons");
    if (likedToons != null) {
      if (likedToons.contains(widget.webtoonModel.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webtoon = ApiService.getToonById(widget.webtoonModel.id);
    episodes = ApiService.getLatestEpisodesById(widget.webtoonModel.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.webtoonModel.id);
      } else {
        likedToons.add(widget.webtoonModel.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: onHeartTap,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline,
              )),
        ],
        title: Text(
          widget.webtoonModel.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                      tag: widget.webtoonModel.id,
                      child: CartoonCard(webtoon: widget.webtoonModel)),
                ],
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data!.about,
                              style: const TextStyle(
                                fontSize: 16,
                              )),
                          const SizedBox(height: 15),
                          Text(
                              '${snapshot.data!.genre} / ${snapshot.data!.age}',
                              style: const TextStyle(
                                fontSize: 16,
                              )),
                        ],
                      );
                    }
                    return const Text("...");
                  }),
              const SizedBox(height: 25),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var eposode in snapshot.data!)
                          Episode(
                            webtoon: widget.webtoonModel,
                            eposode: eposode,
                          )
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
