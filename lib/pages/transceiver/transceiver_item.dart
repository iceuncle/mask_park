import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/resource.dart';
import 'package:maskpark/widget/album_photo.dart';
import 'package:maskpark/widget/my_avatar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/my_icon.dart';
import 'package:maskpark/widget/my_tag.dart';

class TransceiverItem extends StatefulWidget {
  @override
  _TransceiverItemState createState() => _TransceiverItemState();
}

class _TransceiverItemState extends State<TransceiverItem> {
  final String microType = 'microType';
  final String timeType = 'timeType';
  final String locationType = 'locationType';
  final String hopeType = 'hopeType';
  final String foodType = 'foodType';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: S.px(15), top: S.px(10)),
            child: _avatarWidget,
          ),
          _contentWidget,
          _tabWidgets,
          MyDivider(),
          _goodAvatarWidgets,
          MyDivider(height: S.px(10), color: MyColors.background)
        ],
      ),
    );
  }

  get _avatarWidget {
    return Row(
      children: <Widget>[
        MyAvatar(
          avatarUrl: 'http://www.devio.org/img/avatar.png',
          showGender: true,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: S.px(10)),
            child: _nameWidget,
          ),
        )
      ],
    );
  }

  get _nameWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: S.px(5)),
              child: Text(
                "Cindy",
                style: TextStyle(fontSize: 17, color: MyColors.dark),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: S.px(5)),
              child: MyTag(
                name: Strings.of(context).goddess,
                type: MyTag.goddess,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: S.px(5)),
              child: MyTag(
                name: Strings.of(context).real,
                type: MyTag.real,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: EdgeInsets.only(right: S.px(15)),
              child: Image(
                width: S.px(15),
                height: S.px(15),
                image: AssetImage('images/06_more.png'),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: S.px(7)),
              child: Text(
                Strings.of(context).oneMinuteAgo,
                style: TextStyle(fontSize: 12, color: MyColors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: S.px(8)),
              child:
                  MyTag(name: Strings.of(context).myPost, type: MyTag.myPost),
            ),
          ],
        )
      ],
    );
  }

  get _contentWidget {
    return Container(
      margin: EdgeInsets.only(left: S.px(15), right: S.px(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: S.px(30), top: S.px(10)),
            child: Image(image: AssetImage('images/triangle.png')),
          ),
          Container(
            padding:
                EdgeInsets.fromLTRB(S.px(15), S.px(15), S.px(15), S.px(20)),
            decoration: BoxDecoration(
                color: MyColors.lightPurple,
                borderRadius: BorderRadius.circular(S.px(6))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _messageWidgets,
                _albumWidgets,
              ],
            ),
          )
        ],
      ),
    );
  }

  get _messageWidgets {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        {
          'type': microType,
          'message': 'Chat with microphone',
        },
        {
          'type': timeType,
          'message': 'All day on May 8',
        },
        {
          'type': locationType,
          'message': 'Shanghai·People\'s Square',
        },
        {
          'type': hopeType,
          'message': 'Desired object:Interesting',
        },
        {
          'type': foodType,
          'message': 'Have dinner',
        },
      ].map((item) {
        return _messageItem(item['type'], item['message']);
      }).toList(),
    );
  }

  Widget _messageItem(String type, String message) {
    var image = AssetImage('images/10_chat_icon.png');
    if (type == timeType) {
      image = AssetImage('images/10_time_icon.png');
    } else if (type == locationType) {
      image = AssetImage('images/10_location.png');
    } else if (type == hopeType) {
      image = AssetImage('images/10_hope_icon.png');
    } else if (type == foodType) {
      image = AssetImage('images/10_food.png');
    }
    return Row(
      children: <Widget>[
        Image(
          width: S.px(15),
          height: S.px(15),
          image: image,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: S.px(10), top: S.px(3), bottom: S.px(3)),
          child: Text(
            message,
            style: TextStyle(fontSize: 13, color: MyColors.dark),
          ),
        )
      ],
    );
  }

  get _albumWidgets {
    return Container(
      margin: EdgeInsets.fromLTRB(S.px(25), S.px(8), S.px(25), 0),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: S.px(10),
            mainAxisSpacing: S.px(10),
          ),
          itemBuilder: (BuildContext context, int index) {
            return AlbumPhoto();
          }),
    );
  }

  get _tabWidgets {
    List tabDada = myResource.getTransceiverItemTabs(context);
    tabDada[0]['name'] = '25';
    return Container(
      margin: EdgeInsets.fromLTRB(S.px(40), S.px(10), S.px(40), S.px(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabDada.map((item) {
          return MyIcon(
            imageWidth: 23,
            title: item['name'],
            image: item['image'],
            titleColor: item['color'],
          );
        }).toList(),
      ),
    );
  }

  get _goodAvatarWidgets {
    return Container(
      margin: EdgeInsets.fromLTRB(S.px(15), S.px(10), S.px(15), S.px(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: S.px(10)),
            child: Image(
              width: S.px(22),
              height: S.px(30),
              image: AssetImage('images/10_good_icon.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
                itemCount: 18,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  crossAxisSpacing: S.px(5),
                  mainAxisSpacing: S.px(5),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MyAvatar(
                    avatarWidth: 30,
                    avatarUrl: 'http://www.devio.org/img/avatar.png',
                  );
                }),
          ),
        ],
      ),
    );
  }
}
