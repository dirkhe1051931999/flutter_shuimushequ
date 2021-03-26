import 'package:flutter/material.dart';

// 创建响应类
class AppState with ChangeNotifier {
  bool _isGrayFilter;
  bool _isSunDay;
  bool _isPictureMode;
  // 获取
  get isGrayFilter => _isGrayFilter;
  get isSunDay => _isSunDay;
  get isPictureMode => _isPictureMode;
  // 设置
  AppState({
    bool isGrayFilter = false,
    bool isSunDay = true,
    bool isPictureMode = false,
  }) {
    this._isGrayFilter = isGrayFilter;
    this._isSunDay = isSunDay;
    this._isPictureMode = isPictureMode;
  }
  switchGrayFilter() {
    _isGrayFilter = !isGrayFilter;
    notifyListeners();
  }

  switchSunDay() {
    _isSunDay = !_isSunDay;
    notifyListeners();
  }

  switchPictureMode() {
    _isPictureMode = !_isPictureMode;
    notifyListeners();
  }
}
