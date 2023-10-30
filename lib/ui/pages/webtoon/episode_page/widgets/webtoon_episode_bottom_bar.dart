import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/episode_dto/episode_DTO.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/ui/pages/webtoon/episode_page/webtoon_episode_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/reply_page/webtoon_reply_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebtoonEpisodeBottomBar extends ConsumerWidget {
  EpisodeDTO episodeDTO;

  WebtoonEpisodeBottomBar({required this.episodeDTO});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonEpisodeModel? model = ref.watch(webtoonEpisodeProvider);

    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              // Todo: 좋아요 취소기능도 만들어야함
              IconButton(
                icon: _likeIcon(episodeDTO.like),
                onPressed: () async {
                  ref.watch(webtoonEpisodeProvider.notifier).likeEpisode();
                },
              ),
              Text("${episodeDTO.likeEpisodeCount}",
                  style: TextStyle(color: Colors.white)),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.comment, color: Colors.white),
                onPressed: () {
                  print("댓글보기클릭");
                  // ParamStore paramStore = ref.read(paramProvider);
                  // paramStore.addEpisodeDetailId(episodeDTO!.episodeId);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ReplyPage()));
                },
              ),
              Text("${episodeDTO.commentCount}",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // 왼쪽으로 넘어가는 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  // 오른쪽으로 넘어가는 아이콘을 눌렀을 때 수행할 작업 추가
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _likeIcon(bool like) {
    if (like == true) {
      return Icon(CupertinoIcons.heart_fill, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: Colors.white);
    }
  }
}
