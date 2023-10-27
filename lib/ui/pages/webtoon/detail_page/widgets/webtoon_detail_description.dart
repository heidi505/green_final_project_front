import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/data/dto/webtoon_DTO/detail_page_webtoon_DTO.dart';

import '../../../../../_core/constants/size.dart';
import '../../../../common_widgets/advertising.dart';

class WebtoonDetailDescription extends StatefulWidget {
  final DetailPageWebtoonDTO webtoonDTO;

  const WebtoonDetailDescription({
    super.key,
    required this.webtoonDTO,
  });

  @override
  State<WebtoonDetailDescription> createState() => _WebtoonDetailDescriptionState();
}

class _WebtoonDetailDescriptionState extends State<WebtoonDetailDescription> {
  bool isScroll = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(sizePaddingLR17, sizeM10, sizePaddingLR17, sizeM10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.webtoonDTO.title}", style: Theme.of(context).textTheme.displayLarge),
          Row(
            children: [
              InkWell(
                onTap: () {
                  print("작가페이지로 가야함");
                },
                child: Row(
                  children: [Text("${widget.webtoonDTO.authorList.map((author) => author.authorNickname).toList().join('/')}"), Text("✅")],
                ),
              ),
              Text("  ·  "),
              widget.webtoonDTO.webtoonWeekDayEnum! == "월화수목금토일"
                  ? Text("매일 연재", style: TextStyle(color: Colors.grey))
                  : Text("${widget.webtoonDTO.webtoonWeekDayEnum!.split("").join(", ")} 연재"),
            ],
          ),
          Column(
            children: [
              isScroll == true
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: sizeGetScreenWidth(context) * 0.85,
                                child: Text(
                                  "${widget.webtoonDTO.intro}",
                                  style: TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  isScroll = !isScroll;
                                  setState(() {});
                                },
                                child: Icon(Icons.arrow_drop_up),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeS5),
                          Row(
                            children: [
                              Text("연령 : ", style: TextStyle(color: Colors.grey)),
                              Text("${widget.webtoonDTO.ageLimit == 0 ? "전체 이용가" : "${widget.webtoonDTO.ageLimit}세 이용가"}"),
                            ],
                          ),
                          SizedBox(height: sizeS5),
                          Wrap(
                            children: [
                              HashTag(hashTagName: "판타지"),
                              HashTag(hashTagName: "주간남성랭킹 TOP 10"),
                              HashTag(hashTagName: "판타지 무협랭킹 3위"),
                              HashTag(hashTagName: "고인물"),
                              HashTag(hashTagName: "레드아이스 스튜디오"),
                              HashTag(hashTagName: "사이다"),
                              HashTag(hashTagName: "게임판타지"),
                              HashTag(hashTagName: "헌터물"),
                              HashTag(hashTagName: "먼치킨"),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: sizeGetScreenWidth(context) * 0.85,
                            child: Text(
                              "${widget.webtoonDTO.intro}",
                              style: TextStyle(fontSize: 13, color: Colors.grey),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              isScroll = !isScroll;
                              setState(() {});
                            },
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          SizedBox(height: sizeS5),
          Advertising(ADHeight: 75),
        ],
      ),
    );
  }
}

class HashTag extends StatelessWidget {
  HashTag({required this.hashTagName});

  String hashTagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
        child: Text("#${hashTagName}"),
      ),
    );
  }
}
