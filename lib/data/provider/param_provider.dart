import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터
class RequestParam {
  int? webtoonDetailId;
  int? episodeId;

  // int? commentId;

  RequestParam({this.webtoonDetailId});
}

// 2. 창고 (비지니스 로직)
class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;

  void addWebtoonDetailId(int webtoonId) {
    print("파람프로바이더webtoonDetailId : ${webtoonId}");
    this.webtoonDetailId = webtoonId;
  }

  void addEpisodeDetailId(int episodeId) {
    print("파람프로바이더episodeDetailId : ${episodeId}");
    this.episodeId = episodeId;
  }

// void movePostDetail(int postId) {
//   Navigator.push(mContext!, MaterialPageRoute(builder: (_) => PostDetailPage()));
// }
}

// 3. 창고 관리자
final paramProvider = Provider<ParamStore>((ref) {
  return new ParamStore();
});
