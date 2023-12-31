import 'package:flutter_blog/data/dto/episode_dto/episode_move_DTO.dart';
import 'package:flutter_blog/data/model/author.dart';
import 'package:flutter_blog/data/model/episode_photo.dart';
import 'package:intl/intl.dart';

class EpisodeDTO {
  final int episodeId;
  final String detailTitle;
  double starScore;
  double starCount;
  final DateTime createdAt;
  final String authorText;
  // final String authorName;
  final List<Author> authorList;
  final int webtoonId;
  final String webtoonName;
  final int cookieCost;
  int likeEpisodeCount;
  final int commentCount;
  // List<Comment> commentList;
  final List<EpisodePhoto> photoList;
  bool like;
  bool star;
  List<EpisodeMoveDTO> episodeMoveDTOList;
  // 에피소드말고 상위웹툰의 전체 에피소드 개수 필요

  EpisodeDTO(this.episodeId, this.detailTitle, this.starScore, this.starCount, this.createdAt, this.authorText, this.authorList, this.webtoonId,
      this.webtoonName, this.cookieCost, this.commentCount, this.likeEpisodeCount, this.photoList, this.like, this.star, this.episodeMoveDTOList);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  EpisodeDTO.fromJson(Map<String, dynamic> json)
      : episodeId = json["episodeId"],
        detailTitle = json["detailTitle"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        createdAt = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").parse(json["createdAt"]),
        authorText = json["authorText"],
        authorList = (json["authorList"] as List).map((jsonAuthor) => Author.fromJson(jsonAuthor)).toList(),
        webtoonId = json["webtoonId"],
        webtoonName = json["webtoonName"],
        cookieCost = json["cookieCost"],
        commentCount = json["commentCount"],
        likeEpisodeCount = json["likeEpisodeCount"],
        photoList = (json["photoList"] as List).map((jsonPhoto) => EpisodePhoto.fromJson(jsonPhoto)).toList(),
        like = json["like"],
        star = json["star"],
        episodeMoveDTOList = (json["episodeMoveDTOList"] as List).map((jsonDTO) => EpisodeMoveDTO.fromJson(jsonDTO)).toList();

  @override
  String toString() {
    return 'EpisodeDTO{episodeId: $episodeId, detailTitle: $detailTitle, starScore: $starScore, starCount: $starCount, createdAt: $createdAt, authorText: $authorText, authorList: $authorList, webtoonId: $webtoonId, webtoonName: $webtoonName, cookieCost: $cookieCost, likeEpisodeCount: $likeEpisodeCount, commentCount: $commentCount, photoList: $photoList, like: $like, star: $star, episodeMoveDTOList: $episodeMoveDTOList}';
  }
}
