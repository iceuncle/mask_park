import 'package:flutter/material.dart';

import '../main.dart';

var toast = new Toast();

///toast组件
class Toast {
  Toast._internal();

  static Toast _singleton = new Toast._internal();

  factory Toast() => _singleton;

  void show(String message, {int duration}) {
    OverlayEntry entry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.7,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Material(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      );
    });

    Overlay.of(MyApp.context).insert(entry);
    Future.delayed(Duration(seconds: duration ?? 2)).then((value) {
      entry.remove();
    });
  }
}
