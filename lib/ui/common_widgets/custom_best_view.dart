import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/http.dart';
import 'package:flutter_blog/data/dto/webtoon_dto/best_DTO.dart';
import 'package:flutter_blog/ui/pages/webtoon/best_page/webtoon_best_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBestView extends ConsumerWidget {
  final int index;

  const CustomBestView({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WebtoonBestModel? model = ref.watch(webtoonBestProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    List<BestDTO> bestList = model!.bestDTOList;

    return ListView.builder(
      itemCount: bestList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Container(
            height: 120,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    "${imageURL}/WebtoonThumbnail/${bestList[index].image}",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/default_webtoon_Thumbnail.jpg",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(width: 10),
                // 중앙에 제목과 날짜 배치
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${bestList[index].title}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${bestList[index].authorNicknameList}",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "시트콤 같은 일상툰",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        Text(
                          "${bestList[index].starCount}",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "   11:07",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
