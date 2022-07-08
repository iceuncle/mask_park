import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

class RedPoint extends StatelessWidget {
  final String count;
  final double width;

  const RedPoint({Key key, this.count = "", this.width = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: S.px(width),
      height: S.px(width),
      decoration: BoxDecoration(
        color: MyColors.red,
        borderRadius: BorderRadius.circular(S.px(width / 2)),
      ),
      child: Text(
        count,
        style: TextStyle(
          color: Colors.white,
          fontSize: S.px(width / 2),
        ),
      ),
    );
  }
}
