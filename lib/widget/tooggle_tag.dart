import 'package:flutter/material.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';

class ToggleTag extends StatefulWidget {
  final String text;
  final bool isActive;
  final Color color;
  final Color activeColor;
  final Color activeBgColor;
  final Function onTap;
  final ImageProvider image;
  final ImageProvider activeImage;

  const ToggleTag({
    Key key,
    @required this.text,
    this.isActive = false,
    this.color = MyColors.lightGrey,
    this.activeColor = MyColors.theme,
    this.activeBgColor,
    this.onTap,
    this.image,
    this.activeImage,
  }) : super(key: key);

  @override
  _ToggleTagState createState() => _ToggleTagState();
}

class _ToggleTagState extends State<ToggleTag> {
  @override
  Widget build(BuildContext context) {
    Color bgColor = widget.isActive ? widget.activeBgColor : null;
    Color borderActiveColor = widget.activeBgColor == null
        ? widget.activeColor
        : widget.activeBgColor;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.only(left: S.px(9), right: S.px(9)),
        height: S.px(20),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(S.px(10)),
            border: Border.all(
              width: 0.8,
              color: widget.isActive ? borderActiveColor : widget.color,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            widget.image != null
                ? Padding(
                    padding: EdgeInsets.only(right: S.px(3)),
                    child: Image(
                        width: S.px(15),
                        height: S.px(15),
                        image: widget.isActive
                            ? widget.activeImage
                            : widget.image),
                  )
                : Container(),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: S.px(12),
                  color: widget.isActive ? widget.activeColor : widget.color),
            )
          ],
        ),
      ),
    );
  }
}
