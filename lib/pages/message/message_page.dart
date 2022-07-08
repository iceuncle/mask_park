import 'package:flutter/material.dart';
import 'package:maskpark/intl/stock_string.dart';
import 'package:maskpark/main.dart';
import 'package:maskpark/pages/message/message_tab_page.dart';
import 'package:maskpark/util/Screen.dart';
import 'package:maskpark/util/my_colors.dart';
import 'package:maskpark/widget/my_appbar.dart';
import 'package:maskpark/widget/my_divider.dart';
import 'package:maskpark/widget/red_point.dart';

///消息
class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<String> tabs = [
    Strings.of(MyApp.context).chat,
    Strings.of(MyApp.context).message,
  ];

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          MyAppBar(
            showBack: false,
            title: Strings.of(context).messageCenter,
            subTitle: Strings.of(context).pushSettings,
          ),
          TabBar(
            controller: _controller,
            labelColor: MyColors.theme,
            unselectedLabelColor: MyColors.lightGrey,
            indicator: BoxDecoration(),
            tabs: tabs.map<Tab>((tabName) {
              return _tabItem(tabName, "03");
            }).toList(),
          ),
          MyDivider(),
          Flexible(
              flex: 1,
              child: TabBarView(
                controller: _controller,
                children: tabs.map((tabName) {
                  return MessageTabPage(
                    tabName: tabName,
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }

  Widget _tabItem(tabName, messageCount) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(tabName),
          Padding(
            padding: EdgeInsets.only(left: S.px(5)),
            child: RedPoint(count: messageCount),
          )
        ],
      ),
    );
  }
}
