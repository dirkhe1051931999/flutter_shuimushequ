import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shuimushequ/page/application/index.dart';

Handler applicationHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ApplicationPage();
  },
);
