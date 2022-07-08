import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/pages/home/home_tab_page.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/widget/main_appbar.dart';
import 'package:maskpark/widget/my_divider.dart';

import '../../main.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<String> tabs = [
    Strings.of(MyApp.context).nearby,
    Strings.of(MyApp.context).newcomer,
    Strings.of(MyApp.context).goddess,
  ];

  bool isBoy = false;
  bool isOnLineFirst = false;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          MainAppBar(
            title: Strings.of(context).nearby,
            subTitle: Strings.of(context).onlineFirst,
            isBoy: isBoy,
            isOnLineFirst: isOnLineFirst,
            onSearchClick: _onSearchClick,
            onGenderClick: _onGenderClick,
            onSubTitleClick: _onSubTitleClick,
            onTitleClick: _onTitleClick,
          ),
          TabBar(
            controller: _controller,
            labelColor: MyColors.theme,
            unselectedLabelColor: MyColors.lightGrey,
            indicator: UnderlineTabIndicator(),
            tabs: tabs.map<Tab>((tabName) {
              return Tab(
                text: tabName,
              );
            }).toList(),
          ),
          MyDivider(),
          Flexible(
              child: TabBarView(
            controller: _controller,
            children: tabs.map((tabName) {
              return HomeTabPage(
                tabName: tabName,
              );
            }).toList(),
          ))
        ],
      ),
    );
  }

  _onSearchClick() {}

  _onGenderClick() {
    setState(() {
      isBoy = !isBoy;
    });
  }

  _onSubTitleClick() {
    setState(() {
      isOnLineFirst = !isOnLineFirst;
    });
  }

  _onTitleClick() {}
}
