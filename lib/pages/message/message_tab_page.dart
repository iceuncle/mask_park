import 'package:flutter/material.dart';
import 'package:maskpark/pages/personal/personal_detail.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/navigator_util.dart';
import 'package:maskpark/widget/my_avatar.dart';
import 'package:maskpark/widget/loading_container.dart';
import 'package:maskpark/widget/my_divider.dart';

class MessageTabPage extends StatefulWidget {
  final String tabName;

  const MessageTabPage({Key key, this.tabName}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoadingContainer(
      isLoading: _isLoading,
      child: RefreshIndicator(
        displacement: 20,
        onRefresh: _loadData,
        child: _contentView(),
      ),
    );
  }

  _contentView() {
    return ListView.builder(
      padding: kMaterialListPadding,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return _listItem;
      },
    );
  }

  get _listItem {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(S.px(15), S.px(20), S.px(15), S.px(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyAvatar(
                avatarUrl: 'http://www.devio.org/img/avatar.png',
                pointCount: '01',
                onTap: () {
                  NavigatorUtil.push(context, PersonalDetail());
                },
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Column(
                    children: <Widget>[_nameWidget, _contentWidget],
                  ),
                ),
              ),
            ],
          ),
        ),
        MyDivider(indent: S.px(60))
      ],
    );
  }

  ///姓名和时间
  get _nameWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Jason',
          style: TextStyle(
              color: MyColors.dark, fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          '11:32 AM',
          style: TextStyle(
            color: MyColors.divider,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  ///聊天内容
  get _contentWidget {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          'Sister is good, in order to improve the service, 20 sheets per time and 40 sheets per nignt',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: MyColors.grey, fontSize: 13),
        ));
  }

  Future<Null> _loadData({loadMore = false}) {
    return Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
