import 'package:flutter/material.dart';

// 创建响应类
class AppState with ChangeNotifier {
  bool _isGrayFilter;
  bool _isSunDay;
  bool _isPictureMode;
  int _imageViewCurrentIndex = 0;
  dynamic _imageViewAllData;
  // 获取
  get isGrayFilter => _isGrayFilter;
  get isSunDay => _isSunDay;
  get isPictureMode => _isPictureMode;
  get imageViewCurrentIndex => _imageViewCurrentIndex;
  get imageViewAllData => _imageViewAllData;
  // 设置
  AppState(
      {bool isGrayFilter = false,
      bool isSunDay = true,
      bool isPictureMode = false,
      int imageViewCurrentIndex,
      dynamic imageViewAllData}) {
    this._isGrayFilter = isGrayFilter;
    this._isSunDay = isSunDay;
    this._isPictureMode = isPictureMode;
    this._imageViewCurrentIndex = imageViewCurrentIndex;
    this._imageViewAllData = imageViewAllData;
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

  setImageViewCurrentIndex(int index) {
    _imageViewCurrentIndex = index;
    notifyListeners();
  }

  setImageViewAllData(dynamic data) {
    _imageViewAllData = data;
    notifyListeners();
  }
}
