import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/size.dart';
import 'package:flutter_blog/data/provider/advertising_sub_provider.dart';
import 'package:flutter_blog/data/provider/session_provider.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_blog/ui/common_widgets/my_stackbar.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/webtoon_list_view_model.dart';
import 'package:flutter_blog/ui/pages/webtoon/list_page/widgets/webtoon_list_body.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/app_bottom.dart';

class WebtoonListPage extends ConsumerStatefulWidget {
  @override
  _WebtoonListPageState createState() => _WebtoonListPageState();
}

class _WebtoonListPageState extends ConsumerState<WebtoonListPage> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  final ScrollController listPageController = ScrollController();
  bool isScroll = false;

  @override
  void initState() {
    listPageController.addListener(() {
      // print("offset : ${detailPageController.offset}");
      if (listPageController.offset >= 130 && isScroll == false) {
        print("스크롤 감지");
        isScroll = true;
        setState(() {});
      } else if (listPageController.offset < 130 && isScroll == true) {
        print("스크롤 처음");
        isScroll = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.read(advertisingSubProvider).fetchAdvertisingSubList(ref.read(sessionProvider).jwt!);

    return Scaffold(
      bottomNavigationBar: AppBottom(),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            print("리플래시됨");
            await ref.read(webtoonListProvider.notifier).notifyInit();
          },
          child: WebtoonListBody(listPageController, isScroll),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    final mContext = navigatorKey.currentContext;
    DateTime now = DateTime.now();

    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      mySnackbar(
        mContext,
        2000,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("'뒤로' 버튼을 한 번 더 누르시면 종료됩니다.")],
        ),
      );

      return Future.value(false);
    }

    return Future.value(true);
  }
}
