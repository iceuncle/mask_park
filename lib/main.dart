import 'package:flutter/material.dart';
// import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:maskpark/navigator/tab_navigator.dart';
import 'package:maskpark/util/bus.dart';

import 'intl/stock_string.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static var context;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // hideScreen();
    bus.on("401", (arg) {
      print('logout....');
    });
    super.initState();
  }

  @override
  void dispose() {
    bus.off("401");
    super.dispose();
  }

  // Future<void> hideScreen() async {
  //   Future.delayed(Duration(milliseconds: 1500), () {
  //     FlutterSplashScreen.hide();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaskPark',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
      ),
      localizationsDelegates: Strings.localizationsDelegates,
      supportedLocales: Strings.supportedLocales,
      home: TabNavigator(),
    );
  }
}
