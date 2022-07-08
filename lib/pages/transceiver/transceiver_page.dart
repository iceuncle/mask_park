import 'package:flutter/material.dart';
import 'package:maskpark/http/http.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/pages/transceiver/transceiver_item.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/util/resource.dart';
import 'package:maskpark/widget/loading_container.dart';
import 'package:maskpark/widget/my_appbar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/my_icon.dart';

///电台
class TransceiverPage extends StatefulWidget {
  @override
  _TransceiverPageState createState() => _TransceiverPageState();
}

class _TransceiverPageState extends State<TransceiverPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  bool _isLoading = true;
  List bannerList = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];

  GlobalKey tabKey = GlobalKey();
  GlobalKey contentKey = GlobalKey();
  double tabPositionY;
  bool hideTabView = true;

  ScrollController scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    scrollController = new ScrollController();
    _loadData();
    super.initState();
  }

  _afterLayout(_) {
    final RenderBox renderBoxTab = tabKey.currentContext.findRenderObject();
    final positionTab = renderBoxTab.localToGlobal(Offset.zero);
    final RenderBox renderBoxContent =
        contentKey.currentContext.findRenderObject();
    final positionContent = renderBoxContent.localToGlobal(Offset.zero);
    tabPositionY = positionTab.dy - positionContent.dy;
    print("tabPositionY...$tabPositionY");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          MyAppBar(
            showBack: false,
            title: Strings.of(context).transceiver,
            subTitle: Strings.of(context).release,
            subTitleColor: MyColors.theme,
          ),
          Expanded(
              key: contentKey,
              flex: 1,
              child: LoadingContainer(
                isLoading: _isLoading,
                child: RefreshIndicator(
                  displacement: 20,
                  onRefresh: _loadData,
                  child: _bodyWidget,
                ),
              ))
        ],
      ),
    );
  }

  Widget get _bodyWidget {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              _banner,
              _gridNav,
              MyDivider(height: S.px(10), color: MyColors.background),
            ],
          ),
        ),
        SliverAppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          pinned: true,
          title: TabBar(
            key: tabKey,
            controller: TabController(length: 3, vsync: this),
            isScrollable: false,
            labelPadding: EdgeInsets.zero,
            labelColor: MyColors.dark,
            indicator: UnderlineTabIndicator(),
            tabs: <Widget>[
              _tabItem(Strings.of(context).releaseTime),
              _tabItem(Strings.of(context).anyGender),
              _tabItem(Strings.of(context).anyArea),
            ],
          ),
        ),
        SliverList(
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return TransceiverItem();
            },
            childCount: 10,
          ),
        )
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: S.px(120),
      margin: EdgeInsets.fromLTRB(S.px(15), S.px(10), S.px(15), 0),
      child: Image(
        image: AssetImage('images/10_banner.png'),
      ),
    );
  }

  Widget get _gridNav {
    List gridIcons = myResource.getTransceiverGridIcons(context);
    return Container(
      margin: EdgeInsets.fromLTRB(S.px(20), S.px(13), S.px(20), S.px(15)),
      child: GridView.builder(
          itemCount: gridIcons.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: S.px(20),
            mainAxisSpacing: S.px(5),
          ),
          itemBuilder: (BuildContext context, int index) {
            return MyIcon(
              title: gridIcons[index]['title'],
              image: gridIcons[index]['image'],
              titleColor: MyColors.grey,
              onTap: () {
                print(index);
              },
            );
          }),
    );
  }

  Widget _tabItem(name) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        scrollController.jumpTo(tabPositionY);
      },
      child: Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontSize: 15,
                  color: MyColors.dark,
                  fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: EdgeInsets.only(left: S.px(5)),
              child: Image(
                width: S.px(10),
                height: S.px(10),
                image: AssetImage('images/06_dropdown.png'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _loadData({loadMore = false}) {
    return http
        .get<List>(path: 'loanapp/product_default')
        .then((res) {})
        .whenComplete(() {
      setState(() {
        _isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
      });
    });
  }
}
