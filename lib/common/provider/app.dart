import 'package:flutter/material.dart';

// 创建响应类
class AppState with ChangeNotifier {
  bool _isGrayFilter;
  // 获取
  get isGrayFilter => _isGrayFilter;
  // 设置
  AppState(
      {bool isGrayFilter = false,
      dynamic detailsList,
      int curSelectCode,
      int channelType}) {
    this._isGrayFilter = isGrayFilter;
  }
  switchGrayFilter() {
    _isGrayFilter = !isGrayFilter;
    notifyListeners();
  }
}
