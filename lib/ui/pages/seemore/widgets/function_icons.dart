import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunctionIcons extends StatelessWidget {
  const FunctionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 4,
          mainAxisSpacing: 0.5,
          crossAxisSpacing: 0.5,
          children: <Widget>[
            SeeMoreIcons(Icons.search, "검색"),
            SeeMoreIcons(Icons.apple_sharp, "쿠키오븐"),
            SeeMoreIcons(Icons.gamepad_rounded, "쿠키미션"),
            SeeMoreIcons(Icons.speaker, "공지사항"),
            SeeMoreIcons(CupertinoIcons.smiley, "겟짤"),
            SeeMoreIcons(CupertinoIcons.game_controller, "play"),
            SeeMoreIcons(CupertinoIcons.bag, "스토어"),
            SeeMoreIcons(Icons.settings, "설정"),
            SeeMoreIcons(Icons.filter, "폰필터"),
            SeeMoreIcons(Icons.circle, "웹툰 운세"),
            SeeMoreIcons(Icons.cookie_sharp, "내가 만든 쿠키"),
            SeeMoreIcons(CupertinoIcons.heart, "툰BTI"),
          ]),
    );
  }

  Widget SeeMoreIcons(IconData icon, String function) {
    return Column(
      children: [Icon(icon), Text(function)],
    );
  }
}
