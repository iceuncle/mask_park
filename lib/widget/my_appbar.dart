import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

///标题栏
class MyAppBar extends StatefulWidget {
  final Color color;
  final String title;
  final Widget titleImage;
  final bool showBack;
  final String subTitle;
  final Color subTitleColor;
  final bool showMore;
  final bool showDivider;
  final void Function() subTitleClick;
  final void Function() onMoreClick;

  const MyAppBar(
      {Key key,
      this.color = Colors.white,
      this.title = "",
      this.titleImage,
      this.showBack = true,
      this.subTitle = "",
      this.subTitleColor = MyColors.lightGrey,
      this.showMore = false,
      this.showDivider = true,
      this.subTitleClick,
      this.onMoreClick})
      : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: S.px(45),
      decoration: BoxDecoration(
          color: widget.color,
          border: widget.showDivider
              ? Border(bottom: BorderSide(width: 0.8, color: MyColors.divider))
              : null),
      padding: EdgeInsets.fromLTRB(S.px(10), 0, S.px(10), 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _backItem,
              _rightItem,
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 17, color: MyColors.dark),
              ),
              widget.titleImage != null ? widget.titleImage : Container(),
            ],
          )
        ],
      ),
    );
  }

  get _backItem {
    return widget.showBack
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          )
        : Container();
  }

  get _rightItem {
    return Stack(children: <Widget>[
      Offstage(
        offstage: widget.showMore,
        child: _subTitleItem,
      ),
      Offstage(
        offstage: !widget.showMore,
        child: _moreItem,
      ),
    ]);
  }

  get _subTitleItem {
    return GestureDetector(
      onTap: () {
        if (widget.subTitleClick != null) widget.subTitleClick();
      },
      child: Text(widget.subTitle,
          style: TextStyle(fontSize: 13, color: widget.subTitleColor)),
    );
  }

  get _moreItem {
    return GestureDetector(
      onTap: () {
        if (widget.onMoreClick != null) widget.onMoreClick();
      },
      child: Icon(
        Icons.more_horiz,
        color: MyColors.theme,
      ),
    );
  }
}
