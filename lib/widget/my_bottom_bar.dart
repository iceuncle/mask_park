import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/resource.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/red_point.dart';

class MyBottomBar extends StatefulWidget {
  static const String typeMain = "typeMain";
  static const String typePerson = "typePerson";

  final String type;
  final int currentIndex;
  final Color selectedItemColor;
  final double sideMargin;
  final List<bool> showRedPoints;
  final List<String> pointCounts;
  final Function(int index) onTap;

  MyBottomBar(
      {this.type = typeMain,
      this.currentIndex = 0,
      this.selectedItemColor = MyColors.theme,
      this.sideMargin = 0,
      this.showRedPoints,
      this.pointCounts,
      this.onTap});

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    if (widget.type == MyBottomBar.typeMain) {
      data = myResource.getMainTabs(context);
    } else if (widget.type == MyBottomBar.typePerson) {
      data = myResource.getPersonTabs(context);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MyDivider(),
        Container(
          margin: EdgeInsets.only(
              left: S.px(widget.sideMargin), right: S.px(widget.sideMargin)),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              onTap: (index) {
                widget.onTap(index);
              },
              elevation: 0,
              currentIndex: widget.currentIndex,
              selectedFontSize: 12.0,
              selectedItemColor: widget.selectedItemColor,
              unselectedItemColor: MyColors.grey,
              type: BottomNavigationBarType.fixed,
              items: data.asMap().keys.map((index) {
                return _bottomItem(index, data[index]['name']);
              }).toList()),
        )
      ],
    );
  }

  BottomNavigationBarItem _bottomItem(int index, String title) {
    var pointCount =
        widget.pointCounts == null ? null : widget.pointCounts[index];
    bool showRedPoint =
        widget.showRedPoints == null ? false : widget.showRedPoints[index];

    return BottomNavigationBarItem(
        icon: getBotImage(data[index]['image'], pointCount, showRedPoint),
        activeIcon:
            getBotImage(data[index]['activeImage'], pointCount, showRedPoint),
        // title: Padding(
        //   padding: EdgeInsets.only(top: S.px(4)),
        //   child: Text(title),
        // ),
        label: title);
  }

  getBotImage(image, pointCount, showRedPoint) {
    bool showPointCount = pointCount != null && pointCount != "";
    double containerWidth = showPointCount ? S.px(31) : S.px(27);
    return Container(
      width: containerWidth,
      height: S.px(27),
      child: Stack(
        children: <Widget>[
          Image(width: S.px(27), height: S.px(27), image: AssetImage(image)),
          Visibility(
            visible: showPointCount,
            child: Positioned(
              right: 0,
              child: RedPoint(
                width: 11,
                count: pointCount,
              ),
            ),
          ),
          Visibility(
              visible: showRedPoint,
              child: Positioned(right: 0, bottom: 0, child: RedPoint(width: 8)))
        ],
      ),
    );
  }
}
