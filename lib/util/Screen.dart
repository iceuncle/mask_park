import 'dart:ui';

var S = new Screen();

///屏幕适配类
class Screen {
  /// 设计稿标准 750 x 1334 像素
  double _normalWidth = 375;
  double _normalHeight = 667;
  double _normalRatio = 2;

  /// 是否以宽度为适配标准
  bool isBasedInWidth = true;

  /// 真实设备和设计稿标准的换算比例
  double screenWidthRatio;
  double screenHeightRatio;

  /// 设备像素比
  double _devicePixelRatio;

  ///输出比例
  double scale;

  Screen._internal() {
    screenWidthRatio =
        window.physicalSize.width / (_normalWidth * _normalRatio);
    screenHeightRatio =
        window.physicalSize.height / (_normalHeight * _normalRatio);
    _devicePixelRatio = window.devicePixelRatio;

    if (isBasedInWidth == true) {
      scale = _normalRatio * screenWidthRatio / _devicePixelRatio;
    } else {
      scale = _normalRatio * screenHeightRatio / _devicePixelRatio;
    }
  }

  static Screen _singleton = new Screen._internal();

  factory Screen() => _singleton;

  double px(double number) {
    return _singleton._px(number);
  }

  _px(double number) {
    return number * scale;
  }
}
