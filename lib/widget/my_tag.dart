import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

///tag标签
class MyTag extends StatelessWidget {
  static const String normal = "normal";
  static const String location = "location";
  static const String online = "online";
  static const String eye = "eye";
  static const String paid = "paid";
  static const String goddess = "goddess";
  static const String real = "real";
  static const String album = "album";
  static const String myPost = "myPost";

  final String name;
  final String type;
  final double imageSize;
  final double fontSize;
  final Color color;
  final Color textColor;

  const MyTag(
      {Key key,
      @required this.name,
      this.type = normal,
      this.color = MyColors.shadowPurple,
      this.textColor = MyColors.theme,
      this.imageSize = 12,
      this.fontSize = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider provider;
    Color color = this.color;
    Color textColor = this.textColor;

    var padding = EdgeInsets.fromLTRB(9, 5, 9, 5);
    var borderRadius = BorderRadius.circular(S.px(10));
    if (type == location) {
      provider = AssetImage('images/landmark_icon.png');
      color = MyColors.shadowGrey;
      textColor = MyColors.grey;
    } else if (type == online) {
      color = MyColors.shadowGreen;
      textColor = MyColors.green;
    } else if (type == eye) {
      provider = AssetImage('images/browse_icon.png');
      color = MyColors.shadowBlue;
      textColor = MyColors.blue;
    } else if (type == paid) {
      provider = AssetImage('images/paid_icon.png');
      color = MyColors.shadowOrange;
      textColor = MyColors.orange;
    } else if (type == goddess) {
      provider = AssetImage('images/10_goddess_icon.png');
      color = MyColors.pink;
      textColor = Colors.white;
      padding = EdgeInsets.fromLTRB(5, 2, 5, 2);
      borderRadius = BorderRadius.circular(S.px(3));
    } else if (type == real) {
      provider = AssetImage('images/10_realpeople_icon.png');
      color = MyColors.green;
      textColor = Colors.white;
      padding = EdgeInsets.fromLTRB(5, 2, 5, 2);
      borderRadius = BorderRadius.circular(S.px(3));
    } else if (type == album) {
      provider = AssetImage('images/show_icon_01.png');
      color = MyColors.theme;
      textColor = Colors.white;
      padding = EdgeInsets.fromLTRB(6, 2, 7, 2);
    } else if (type == myPost) {
      color = MyColors.shadowGrey;
      textColor = MyColors.grey;
      padding = EdgeInsets.fromLTRB(10, 3, 10, 3);
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          provider != null
              ? Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Image(
                    width: S.px(imageSize),
                    height: S.px(imageSize),
                    image: provider,
                  ),
                )
              : Container(),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}
