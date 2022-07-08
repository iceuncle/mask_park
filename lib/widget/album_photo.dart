import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

class AlbumPhoto extends StatefulWidget {
  ///正常无样式
  static const String normal = "normal";

  ///阅后即焚 展示边框 焚毁角标 透明朦层
  static const String readBurn = "readBurn";

  ///红包解锁 展示 礼物角标 透明朦层
  static const String giftLock = "giftLock";

  ///已焚毁 展示已焚毁朦层
  static const String burned = "burned";

  ///已加锁 展示内容敏感朦层
  static const String blocked = "blocked";

  ///更多图片 展示朦层 数字
  static const String more = "more";

  final String imageUrl;
  final String type;
  final bool showSelf;
  final String moreCount;

  const AlbumPhoto({
    Key key,
    this.imageUrl = 'http://www.devio.org/img/avatar.png',
    this.type = normal,
    this.showSelf = false,
    this.moreCount = '05',
  }) : super(key: key);

  @override
  _AlbumPhotoState createState() => _AlbumPhotoState();
}

class _AlbumPhotoState extends State<AlbumPhoto> {
  @override
  Widget build(BuildContext context) {
    bool showSelf = widget.showSelf;
    if (widget.type == AlbumPhoto.more ||
        widget.type == AlbumPhoto.burned ||
        widget.type == AlbumPhoto.blocked) showSelf = false;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      child: Container(
        height: S.px(76),
        width: S.px(76),
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
            ),
            widget.type == AlbumPhoto.readBurn ? _readBurnWidget : Container(),
            widget.type == AlbumPhoto.giftLock ? _giftLockWidget : Container(),
            widget.type == AlbumPhoto.more ? _moreWidget : Container(),
            widget.type == AlbumPhoto.burned ? _burnedWidget : Container(),
            widget.type == AlbumPhoto.blocked ? _blockedWidget : Container(),
            showSelf ? _selfWidget : Container(),
          ],
        ),
      ),
    );
  }

  get _selfWidget {
    return Positioned(
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(S.px(8), S.px(3), S.px(8), S.px(3)),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/self_icon.png"),
        )),
        child: Text(
          Strings.of(context).self,
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
      ),
    );
  }

  get _readBurnWidget {
    return Container(
        decoration: BoxDecoration(
          color: Color(0x99000000),
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(width: 3, color: MyColors.theme),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 1,
              top: 1,
              child: Image(
                width: S.px(12),
                height: S.px(12),
                image: AssetImage('images/fire_icon.png'),
              ),
            ),
            Center(
              child: Text(
                Strings.of(context).burnAfterRead,
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ));
  }

  get _giftLockWidget {
    return Container(
        color: Color(0x99000000),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 4,
              top: 4,
              child: Image(
                width: S.px(12),
                height: S.px(12),
                image: AssetImage('images/gift_icon.png'),
              ),
            )
          ],
        ));
  }

  get _moreWidget {
    return Container(
        color: Color(0x99000000),
        child: Center(
          child: Text(
            '+ ${widget.moreCount}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }

  get _burnedWidget {
    return Container(
      alignment: AlignmentDirectional.center,
      color: MyColors.shadowPurple,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
              width: S.px(30),
              height: S.px(30),
              image: AssetImage('images/burned_icon.png')),
          Padding(
            padding: EdgeInsets.only(top: S.px(5)),
            child: Text(
              Strings.of(context).burned,
              style: TextStyle(
                  fontSize: 11,
                  color: MyColors.theme,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  get _blockedWidget {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/blocked.png'))),
      child: Center(
        child: Text(
          'Content sensitive, blocked',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: MyColors.theme),
        ),
      ),
    );
  }
}
