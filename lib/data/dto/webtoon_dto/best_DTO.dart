import 'package:intl/intl.dart';

class BestDTO {
  final int id;
  final String title;
  double? starScore;
  double? starCount;
  String? image;
  int? ageLimit;
  String? webtoonSpeciallyEnum;
  String? webtoonWeekDayEnum;
  List<String>? authorNicknameList;
  DateTime? episodeUpdatedAt;

  BestDTO(this.id, this.title, this.starScore, this.starCount, this.image,
      this.ageLimit, this.webtoonSpeciallyEnum, this.webtoonWeekDayEnum);

  // Map 형태로 받아서 Dart 객체로 변환합니다.
  BestDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        starScore = json["starScore"],
        starCount = json["starCount"],
        image = json["image"],
        ageLimit = json["ageLimit"],
        webtoonSpeciallyEnum = json["webtoonSpeciallyEnum"],
        webtoonWeekDayEnum = json["webtoonWeekDayEnum"],
        // authorNicknameList = json["authorNicknameList"];
        authorNicknameList = (json["authorNicknameList"] as List)
            .map((jsonAuthorNickname) => jsonAuthorNickname.toString())
            .toList(),
        episodeUpdatedAt = json["episodeUpdatedAt"] == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ")
                .parse(json["episodeUpdatedAt"]);

  @override
  String toString() {
    return 'BestDTO{id: $id, title: $title, starScore: $starScore, starCount: $starCount, image: $image, ageLimit: $ageLimit, webtoonSpeciallyEnum: $webtoonSpeciallyEnum, webtoonWeekDayEnum: $webtoonWeekDayEnum, authorNicknameList: $authorNicknameList}';
  }
}
