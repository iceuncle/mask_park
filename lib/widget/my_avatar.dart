import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/widget/my_tag.dart';
import 'package:maskpark/widget/red_point.dart';

///带消息红点头像
class MyAvatar extends StatefulWidget {
  static const String male = "male";
  static const String female = "female";

  ///头像链接地址
  final String avatarUrl;

  ///头像宽度
  final double avatarWidth;

  ///是否展示消息小红点
  final bool showRedPoint;

  ///消息小红点或者性别图片宽度
  final double pointWidth;

  ///消息数量
  final String pointCount;

  ///是否展示底部相册图片
  final bool showBotAlbum;

  ///相册图片数量
  final String albumCount;

  ///显示性别
  final bool showGender;

  ///性别
  final String gender;

  ///margin
  final EdgeInsetsGeometry margin;

  ///点击事件
  final Function onTap;

  const MyAvatar({
    Key key,
    @required this.avatarUrl,
    this.avatarWidth = 60,
    this.showRedPoint = true,
    this.pointWidth = 16,
    this.pointCount = "0",
    this.showBotAlbum = false,
    this.albumCount = "0",
    this.showGender = false,
    this.gender = female,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  _MyAvatarState createState() => _MyAvatarState();
}

class _MyAvatarState extends State<MyAvatar> {
  @override
  Widget build(BuildContext context) {
    var containerWidth = widget.showRedPoint
        ? S.px(widget.avatarWidth + 5)
        : S.px(widget.avatarWidth);
    var containerHeight = widget.showBotAlbum
        ? S.px(widget.avatarWidth + 11)
        : S.px(widget.avatarWidth);

    bool showRedPoint = true;
    if (!widget.showRedPoint || widget.pointCount == '0') {
      showRedPoint = false;
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        margin: widget.margin,
        child: Stack(
          children: <Widget>[
            ClipOval(
              child: CachedNetworkImage(
                placeholder: (context, url) => Image(
                  image: AssetImage('images/06_avatar.png'),
                ),
                imageUrl: widget.avatarUrl,
                width: S.px(widget.avatarWidth),
                height: S.px(widget.avatarWidth),
              ),
            ),
            Visibility(
              visible: showRedPoint,
              child: _redPointWidget,
            ),
            Visibility(
              visible: widget.showBotAlbum,
              child: _botAlbumWidget,
            ),
            Visibility(
              visible: widget.showGender,
              child: _botGenderWidget,
            ),
          ],
        ),
      ),
    );
  }

  get _redPointWidget {
    return Positioned(
      right: 0,
      child: RedPoint(
        count: widget.pointCount,
        width: widget.pointWidth,
      ),
    );
  }

  get _botAlbumWidget {
    return Positioned(
      bottom: 0,
      child: MyTag(
        name: widget.albumCount,
        type: MyTag.album,
        imageSize: 8,
        fontSize: 10,
      ),
    );
  }

  get _botGenderWidget {
    ImageProvider provider = widget.gender == MyAvatar.female
        ? AssetImage("images/female_icon.png")
        : AssetImage("images/male_icon.png");
    return Positioned(
        bottom: 0,
        right: 0,
        child: Image(
          width: S.px(widget.pointWidth),
          height: S.px(widget.pointWidth),
          image: provider,
        ));
  }
}
