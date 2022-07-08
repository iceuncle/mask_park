import 'package:flutter/material.dart';
import 'package:maskpark/util/my_colors.dart';

///分割线
class MyDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double indent;
  final double enIndent;

  const MyDivider(
      {Key key,
      this.height = 0.8,
      this.color = MyColors.divider,
      this.indent = 0,
      this.enIndent = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: indent, right: enIndent),
      decoration: BoxDecoration(color: color),
    );
  }
}
