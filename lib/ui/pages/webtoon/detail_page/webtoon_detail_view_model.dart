import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';
import 'package:flutter_blog/data/provider/param_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/data/repository/webtoon_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터

class WebtoonDetailModel {
  DetailPageWebtoonDTO webtoonDTO;

  WebtoonDetailModel({required this.webtoonDTO});
}

// 2. 창고
class WebtoonDetailViewModel extends StateNotifier<WebtoonDetailModel?> {
  Ref ref;

  final mContext = navigatorKey.currentContext;

  // StateNotifier<PostListModel?> 에서 PostListModel은 상태의 타입
  WebtoonDetailViewModel(this.ref, super._state); // 상태가 바뀌면 자동으로 그려짐
  //
  // notify 구독자들에게 알려줌
  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    int webtoonId = ref.read(paramProvider).webtoonDetailId!;
    ResponseDTO responseDTO = await WebtoonRepository().fetchWebtoon(sessionUser.jwt!, webtoonId);
    state = WebtoonDetailModel(webtoonDTO: responseDTO.data);
  }

  Future<void> notifyInterest() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    //TODO
    // ResponseDTO responseDTO = await WebtoonRepository().fetchWebtoon(sessionUser.jwt!, webtoonId);
    // state!.webtoonDTO.interestCount = state!.webtoonDTO.interestCount + 1;
    // state = WebtoonDetailModel(webtoonDTO: responseDTO.data);
  }

//
// Future<void> notifyAdd(PostSaveReqDTO dto) async {
//   SessionUser sessionUser = ref.read(sessionProvider);
//
//   ResponseDTO responseDTO = await PostRepository().savePost(sessionUser.jwt!, dto);
//
//   if (responseDTO.code == 1) {
//     Post newPost = responseDTO.data as Post; // 1. dynamic(Post)
//
//     // ResponseDTO response2DTO = await PostRepository().fetchPostList(sessionUser.jwt!);
//     // state = PostListModel(posts: response2DTO.data);
//
//     List<Post> newPosts = [newPost, ...state!.posts]; // 2. 기존 상태에 데이터 추가
//     state = WebtoonDetailModel(posts: newPosts); // 3. 뷰모델(창고) 데이터 갱신 -> watch 구독자 자동으로 리빌드됨
//     // 다만 글 작성 하는 중간에 다른 사람이 글을 적었다고 치면 그 글은 안보임
//
//     Navigator.pop(mContext!);
//   } else {
//     ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("게시물 작성 실패 : ${responseDTO.msg}")));
//   }
// }

//
}

// 3. 창고 관리자 (View가 빌드되기 직전에 생성됨)
final webtoonDetailProvider = StateNotifierProvider.autoDispose<WebtoonDetailViewModel, WebtoonDetailModel?>((ref) {
  // Logger().d("webtoonDetail창고관리자 실행됨");
  return new WebtoonDetailViewModel(ref, null)..notifyInit();
});
