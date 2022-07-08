import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/widget/tooggle_tag.dart';

///首页标题栏
class MainAppBar extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool isBoy;
  final bool isOnLineFirst;
  final void Function() onSearchClick;
  final void Function() onGenderClick;
  final void Function() onTitleClick;
  final void Function() onSubTitleClick;

  const MainAppBar(
      {Key key,
      this.title,
      this.subTitle,
      this.isBoy = false,
      this.isOnLineFirst = false,
      this.onSearchClick,
      this.onGenderClick,
      this.onTitleClick,
      this.onSubTitleClick})
      : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: S.px(45),
      padding: EdgeInsets.fromLTRB(S.px(16), 0, S.px(10), 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _leftItems,
              _rightItem,
            ],
          ),
          _titleItem,
        ],
      ),
    );
  }

  get _leftItems {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (widget.onSearchClick != null) widget.onSearchClick();
          },
          child: Image(
              width: S.px(18),
              height: S.px(20),
              image: AssetImage('images/search.png')),
        ),
        Padding(
          padding: EdgeInsets.only(left: S.px(17)),
          child: GestureDetector(
            onTap: () {
              if (widget.onGenderClick != null) widget.onGenderClick();
            },
            child: Image(
                width: S.px(20),
                height: S.px(20),
                image: AssetImage(widget.isBoy
                    ? 'images/boy_light.png'
                    : 'images/girl_light.png')),
          ),
        )
      ],
    );
  }

  get _rightItem {
    return ToggleTag(
      text: widget.subTitle,
      isActive: widget.isOnLineFirst,
      onTap: () {
        if (widget.onSubTitleClick != null) {
          widget.onSubTitleClick();
        }
      },
    );
  }

  get _titleItem {
    return GestureDetector(
      onTap: () {
        if (widget.onTitleClick != null) widget.onTitleClick();
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontSize: 17, color: MyColors.dark),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Image(
                  width: S.px(12),
                  height: S.px(12),
                  image: AssetImage('images/06_dropdown.png')),
            )
          ]),
    );
  }
}
