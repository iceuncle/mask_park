import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

///item通用布局
class MyItem extends StatelessWidget {
  final Color color;
  final String title;
  final Color titleColor;
  final String value;
  final Color valueColor;
  final String subTitle;
  final Color subTitleColor;
  final bool showMore;
  final Function onTap;

  const MyItem({
    Key key,
    this.color = Colors.white,
    this.title = "",
    this.titleColor = MyColors.dark,
    this.value = "",
    this.valueColor = MyColors.dark,
    this.subTitle = "",
    this.subTitleColor = MyColors.divider,
    this.showMore = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: color,
        height: S.px(50),
        padding: EdgeInsets.only(left: S.px(15), right: S.px(15)),
        child: Row(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(minWidth: S.px(105)),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: titleColor),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: TextStyle(fontSize: 16, color: valueColor),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 12, color: subTitleColor),
                ),
                Visibility(
                  visible: showMore,
                  child: Padding(
                    padding: EdgeInsets.only(left: S.px(5)),
                    child: Image(
                        width: S.px(12),
                        height: S.px(12),
                        image: AssetImage('images/arrow_icon.png')),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
