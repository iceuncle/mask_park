import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

///图标组件
class MyIcon extends StatelessWidget {
  final double width;
  final double imageWidth;
  final ImageProvider image;
  final String title;
  final Color titleColor;
  final double titleSize;
  final Function onTap;

  const MyIcon({
    Key key,
    @required this.image,
    this.width = 45,
    this.imageWidth = 45,
    this.title = "",
    this.titleColor = MyColors.dark,
    this.titleSize = 11,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: S.px(width),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: S.px(imageWidth),
                height: S.px(imageWidth),
                fit: BoxFit.fill,
                image: image,
              ),
              Padding(
                padding: EdgeInsets.only(top: S.px(5)),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: titleSize, color: titleColor),
                ),
              )
            ],
          ),
        ));
  }
}
