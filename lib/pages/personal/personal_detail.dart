import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/widget/album_photo.dart';
import 'package:maskpark/widget/my_appbar.dart';
import 'package:maskpark/widget/my_bottom_bar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/my_item.dart';
import 'package:maskpark/widget/my_tag.dart';
import 'package:maskpark/widget/tooggle_tag.dart';
import 'package:sprintf/sprintf.dart';

///个人详情页
class PersonalDetail extends StatefulWidget {
  @override
  _PersonalDetailState createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MyAppBar(
              showBack: true,
              title: 'Jsson',
              titleImage: Image(
                  width: S.px(30),
                  height: S.px(15),
                  image: AssetImage('images/vip_icon.png')),
              showMore: true,
            ),
            Expanded(
              flex: 1,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _avatar,
                  Container(
                    padding: EdgeInsets.only(top: S.px(10)),
                    child: _tags,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: S.px(10)),
                    child: _stateTags,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: S.px(10)),
                    child: _isByInvitationWidget,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: S.px(2), bottom: S.px(10)),
                    child: _isRealWidget,
                  ),
                  MyDivider(height: S.px(10), color: MyColors.background),
                  MyItem(
                    title: Strings.of(context).hisActivity,
                  ),
                  MyDivider(height: S.px(10), color: MyColors.background),
                  MyItem(
                    title: Strings.of(context).myPhoto,
                    showMore: false,
                  ),
                  MyDivider(),
                  _noAlbumWidget,
                  MyDivider(),
                  _lockAlbumWidget,
                  MyDivider(),
                  _albumWidget,
                  MyDivider(height: S.px(10), color: MyColors.background),
                  MyItem(
                    title: Strings.of(context).height,
                    titleColor: MyColors.lightGrey,
                    showMore: true,
                    value: "183 CM",
                  ),
                  MyDivider(),
                  MyItem(
                    title: Strings.of(context).residentCity,
                    titleColor: MyColors.lightGrey,
                    showMore: false,
                    value: "ShangHai",
                  ),
                  MyDivider(),
                  MyItem(
                    title: Strings.of(context).datingItems,
                    titleColor: MyColors.lightGrey,
                    showMore: false,
                    value: "Watch movie",
                  ),
                  MyDivider(),
                  MyItem(
                    title: Strings.of(context).expectation,
                    titleColor: MyColors.lightGrey,
                    showMore: false,
                    value: "Intersting",
                  ),
                  MyDivider(),
                  MyItem(
                    title: Strings.of(context).introduction,
                    titleColor: MyColors.lightGrey,
                    showMore: false,
                    value: "Find someone with a common interest",
                  ),
                  MyDivider(),
                  _bottomTipWidget
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar(
        type: MyBottomBar.typePerson,
        sideMargin: 30,
        selectedItemColor: MyColors.grey,
        onTap: (index) {
          print("PersonalDetail index  $index");
        },
      ),
    );
  }

  ///头像
  get _avatar {
    return Container(
      color: Colors.white,
      height: S.px(95),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'http://www.devio.org/img/avatar.png',
              width: S.px(80),
              height: S.px(80),
            ),
          ),
          Positioned(
            right: S.px(10),
            top: S.px(10),
            child: ToggleTag(
              isActive: isLike,
              activeColor: MyColors.redAccent,
              activeBgColor: MyColors.shadowRed,
              text: Strings.of(context).lowCaseLike,
              image: AssetImage('images/07like.png'),
              activeImage: AssetImage('images/07love_solid.png'),
              onTap: () {
                setState(() {
                  isLike = !isLike;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  ///标签
  get _tags {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyTag(name: "ShangHai"),
        Container(
          margin: EdgeInsets.only(left: S.px(10)),
          child: MyTag(name: "25 · Cancer"),
        ),
        Container(
          margin: EdgeInsets.only(left: S.px(10)),
          child: MyTag(name: "Personnel"),
        ),
      ],
    );
  }

  ///距离和在线状态标签
  get _stateTags {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyTag(
          name: "2m",
          type: MyTag.location,
        ),
        Container(
          margin: EdgeInsets.only(left: S.px(10)),
          child: MyTag(
            name: "Online",
            type: MyTag.online,
          ),
        ),
      ],
    );
  }

  ///是否通过邀请进入系统
  get _isByInvitationWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          width: S.px(12),
          height: S.px(12),
          image: AssetImage("images/agreebox.png"),
        ),
        Padding(
          padding: EdgeInsets.only(left: S.px(5)),
          child: Container(
            constraints: BoxConstraints(maxWidth: S.px(210)),
//            decoration: BoxDecoration(color: MyColors.grey),
            child: Text(
              Strings.of(context).isByInvitationTip,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, color: MyColors.lightGrey),
            ),
          ),
        )
      ],
    );
  }

  ///是否人脸认证
  get _isRealWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: MyTag(name: Strings.of(context).real, type: MyTag.real),
        ),
        Text(
          Strings.of(context).isRealTip,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: MyColors.lightGrey),
        )
      ],
    );
  }

  ///相册图片
  get _noAlbumWidget {
    return Container(
      alignment: AlignmentDirectional.center,
      height: S.px(118),
      child: Text(
        Strings.of(context).notPhotoTip,
        style: TextStyle(color: MyColors.divider, fontSize: 15),
      ),
    );
  }

  ///锁定相册状态
  get _lockAlbumWidget {
    return Container(
      height: S.px(151),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: S.px(10)),
            child: Image(
              width: S.px(45),
              height: S.px(45),
              image: AssetImage('images/07_lock_icon.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: S.px(10)),
            child: Text(
              Strings.of(context).albumBlockTip1,
              style: TextStyle(color: MyColors.dark, fontSize: 13),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: S.px(5)),
            child: Text(
              sprintf(Strings.of(context).albumBlockTip2, [2]),
              style: TextStyle(color: MyColors.lightGrey, fontSize: 12),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(S.px(20), S.px(4), S.px(20), S.px(4)),
            decoration: BoxDecoration(
                color: MyColors.theme,
                borderRadius: BorderRadius.circular(S.px(17))),
            margin: EdgeInsets.only(top: S.px(10)),
            child: Text(
              sprintf(Strings.of(context).albumBlockTip3, [100, 'coins']),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  ///相册
  get _albumWidget {
    return Container(
      margin: EdgeInsets.fromLTRB(S.px(27), S.px(9), S.px(27), S.px(20)),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: S.px(6),
            mainAxisSpacing: S.px(10),
          ),
          itemBuilder: (BuildContext context, int index) {
            return AlbumPhoto(
              type: AlbumPhoto.readBurn,
              showSelf: true,
            );
          }),
    );
  }

  ///底部提示
  get _bottomTipWidget {
    return Container(
      color: MyColors.background,
      alignment: AlignmentDirectional.topCenter,
      padding: EdgeInsets.only(top: S.px(16)),
      height: S.px(88),
      child: Text(
        Strings.of(context).conductTip,
        style: TextStyle(color: MyColors.greyAccent, fontSize: 12),
      ),
    );
  }
}
