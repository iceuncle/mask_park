import 'package:flutter/services.dart';

class IMManager {
  static const MethodChannel _channel = const MethodChannel('im_plugin');

  static Future<String> sendMessage({Map params}) async {
    return await _channel.invokeMethod('sendMessage', params ?? {});
  }

  static Future<String> hello() async {
    return await _channel.invokeMethod('hello');
  }
}
