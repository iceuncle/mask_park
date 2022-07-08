import 'package:flutter/material.dart';
import 'package:maskpark/http/http.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/pages/personal/personal_detail.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/navigator_util.dart';
import 'package:maskpark/widget/loading_container.dart';
import 'package:maskpark/widget/my_avatar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/my_tag.dart';

class HomeTabPage extends StatefulWidget {
  final String tabName;

  const HomeTabPage({Key key, this.tabName}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;
  List data = [];
  List midList = [
    {'name': 'ShangHai', 'type': null},
    {'name': '27·Sagittarus', 'type': null},
    {'name': 'Administration', 'type': null}
  ];
  List botList = [
    {'name': '5m', 'type': MyTag.location},
    {'name': 'Online', 'type': MyTag.online},
    {'name': 'Apply', 'type': MyTag.eye},
    {'name': 'Paid photo album', 'type': MyTag.paid},
  ];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
              _scrollController.position.maxScrollExtent - 150 &&
          !isFetching) {
        _loadData(isRefresh: false);
      }
    });
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
        child: ListView.builder(
          controller: _scrollController,
          padding: kMaterialListPadding,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                NavigatorUtil.push(context, PersonalDetail());
              },
              behavior: HitTestBehavior.opaque,
              child: _listItem,
            );
          },
        ),
      ),
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
                showRedPoint: false,
                showBotAlbum: true,
                albumCount: '16',
                margin: EdgeInsets.only(right: 10),
              ),
              _rightListItem,
            ],
          ),
        ),
        MyDivider(indent: S.px(60))
      ],
    );
  }

  get _rightListItem {
    return Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _rightTopItem,
            Container(
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(top: 5),
              child: _wrapTags(midList),
            ),
            Container(
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(top: 5),
              child: _wrapTags(botList),
            ),
          ],
        ));
  }

  get _rightTopItem {
    return Row(
      children: <Widget>[
        Text(
          'Jason',
          style: TextStyle(
              color: MyColors.dark, fontSize: 17, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: EdgeInsets.only(left: S.px(5)),
          child: MyTag(name: Strings.of(context).real, type: MyTag.real),
        ),
        Padding(
          padding: EdgeInsets.only(left: S.px(5)),
          child: Image(
            width: S.px(24),
            height: S.px(15),
            image: AssetImage('images/vip_icon.png'),
          ),
        )
      ],
    );
  }

  _wrapTags(List array) {
    return Wrap(
      spacing: S.px(5),
      runSpacing: S.px(5),
      children: array.map<Widget>((item) {
        return MyTag(name: item['name'], type: item['type']);
      }).toList(),
    );
  }

  bool isFetching = false;

  Future<Null> _loadData({isRefresh = true}) {
    isFetching = true;
    return http.get<List>(path: 'loanapp/product_default').then((res) {
//      List<ProductBean> productBeans =
//          res.data.map((m) => ProductBean.fromJson(m)).toList();
//      print(productBeans[0].name);
      if (isRefresh) data.clear();
      data.addAll(List(100));
    }).whenComplete(() {
      setState(() {
        isFetching = false;
        _isLoading = false;
      });
    });
  }
}
