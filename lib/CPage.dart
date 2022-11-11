import 'package:flutter/material.dart';

class CPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CPage> {
  late PageController _controller;
  var pageOffset = 0.0;
  var screenWidth = 0.0;
  var images = [
    'assets/image/1.jpg',
    'assets/image/2.jpg',
    'assets/image/3.jpg',
    'assets/image/4.jpg'
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    // 監聽 PageController 的 Scroller 變化
    _controller.addListener(_offsetChanged);
  }

  void _offsetChanged() {
    // 每次的移動都重新計算對應的偏移值與特效
    setState(() {
      pageOffset = _controller.offset / screenWidth;
    });
  }
  @override
  Widget build(BuildContext context) {
    // 預設使用螢幕的寬度
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('遊戲畫面'),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            // 計算每次異動時左邊的 Page 是哪個 index
            var currentLeftPageIndex = pageOffset.floor();
            // 計算現在畫面 Offset 佔的比例
            var currentPageOffsetPercent = pageOffset - currentLeftPageIndex;
            // 加入移動的特效
            return Transform.translate(
              // 因爲是水平滑動，所以設定 offset 的 X 值，因爲 Page 固定不動
              // 所以要先用 pageOffset 減去 index 得到 負數
              // 如果是垂直滑動，請設定 offset 的 Y 值
              offset: Offset((pageOffset - index) * screenWidth, 0),
              // 加入調整透明度效果
              child: Opacity(
                // 如果現在左邊的 index 等於正要建立的 index，則讓它透明度變淡，因爲它要退出畫面了
                // 相反地是要顯示，則使用原本的 currentPageOffsetPercent
                opacity: currentLeftPageIndex == index
                    ? 1 - currentPageOffsetPercent
                    : currentPageOffsetPercent,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover))),
              ),
            );
          },
        ));
  }
}