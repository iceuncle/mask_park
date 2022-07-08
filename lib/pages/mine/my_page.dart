import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/plugin/im_plugin.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/resource.dart';
import 'package:maskpark/widget/my_appbar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/my_icon.dart';
import 'package:maskpark/widget/my_item.dart';
import 'package:maskpark/widget/my_tag.dart';

///我的
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    IMManager.sendMessage(params: {"a": 1}).then((res) {
      print("aaa $res");
    });
    IMManager.hello();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          MyAppBar(
            showBack: false,
            title: "Cindy",
            subTitle: Strings.of(context).myComment,
            subTitleColor: MyColors.theme,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: S.px(15)),
                  child: Center(
                    child: _avatar,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: S.px(10)),
                  child: _tags,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      S.px(50), S.px(20), S.px(50), S.px(20)),
                  child: _navIcons,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).certificationCenter,
                  subTitle: Strings.of(context).authenticationNow,
                  onTap: onCertificationCenterClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).myBroadcast,
                  onTap: onMyBroadcastClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).myPhoto,
                  subTitle: Strings.of(context).uploadPhotosOrVideos,
                  showMore: false,
                  subTitleColor: MyColors.theme,
                  onTap: onMyPhotoClick,
                ),
                MyDivider(),
                _uploadPhotoWidget,
                MyDivider(),
                MyItem(
                  title: Strings.of(context).albumPrivacy,
                  subTitle: Strings.of(context).public,
                  onTap: onAlbumPrivacyClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).blacklist,
                  onTap: onBlacklistClick,
                ),
                MyDivider(),
                MyItem(
                  title: Strings.of(context).set,
                  subTitle: Strings.of(context).privacySettings,
                  onTap: onSetClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).shareApp,
                  onTap: onShareAppClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
                MyItem(
                  title: Strings.of(context).needHelp,
                  subTitle: Strings.of(context).contactCustomerService,
                  subTitleColor: MyColors.theme,
                  onTap: onNeedHelpClick,
                ),
                MyDivider(),
                MyItem(
                  title: Strings.of(context).complaintService,
                  onTap: onComplaintServiceClick,
                ),
                MyDivider(height: S.px(10), color: MyColors.background),
              ],
            ),
          )
        ],
      ),
    );
  }

  ///头像
  get _avatar {
    return ClipOval(
      child: Image.network(
        'http://www.devio.org/img/avatar.png',
        width: S.px(80),
        height: S.px(80),
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

  get _navIcons {
    List gridIcons = myResource.getMineGridIcons(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: gridIcons.map((item) {
        return MyIcon(
          title: item['name'],
          image: item['image'],
          width: 75,
          imageWidth: 27,
          titleSize: 12,
        );
      }).toList(),
    );
  }

  ///上传图片
  get _uploadPhotoWidget {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: AlignmentDirectional.center,
        height: S.px(118),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.of(context).uploadFirstPhoto,
              style: TextStyle(fontSize: 15, color: MyColors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                Strings.of(context).uploadPhotoTip,
                style: TextStyle(fontSize: 13, color: MyColors.divider),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCertificationCenterClick() {
    print('certificationCenter....');
  }

  void onMyBroadcastClick() {
    print('myBroadcast...');
  }

  void onMyPhotoClick() {}

  void onAlbumPrivacyClick() {}

  void onBlacklistClick() {}

  void onSetClick() {}

  void onShareAppClick() {}

  void onNeedHelpClick() {}

  void onComplaintServiceClick() {}
}
