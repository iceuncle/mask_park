import 'package:flutter/material.dart';
import 'package:maskpark/pages/home/home_page.dart';
import 'package:maskpark/pages/message/message_page.dart';
import 'package:maskpark/pages/mine/my_page.dart';
import 'package:maskpark/pages/transceiver/transceiver_page.dart';
import 'package:maskpark/widget/my_bottom_bar.dart';

import '../main.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  var showRedPoints = [false, true, false, false];
  var pointCounts = ["", "", "06", ""];

  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    MyApp.context = context;
    return Scaffold(
        body: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            HomePage(),
            TransceiverPage(),
            MessagePage(),
            MyPage(),
          ],
          physics: NeverScrollableScrollPhysics(), //设置不滑动
        ),
        bottomNavigationBar: MyBottomBar(
          currentIndex: _currentIndex,
          sideMargin: 10,
          showRedPoints: showRedPoints,
          pointCounts: pointCounts,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}

class BottomNav extends BottomNavigationBar {}
