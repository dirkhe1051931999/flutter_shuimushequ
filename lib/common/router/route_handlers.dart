import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/application/index.dart';
import 'package:shuimushequ/page/login/index.dart';
import 'package:shuimushequ/page/search/index.dart';
import 'package:shuimushequ/page/welcome/index.dart';

Handler applicationHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ApplicationPage();
  },
);
Handler imageViewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ImageViewPage();
  },
);
Handler searchPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SearchPage();
  },
);
Handler welcomePageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return WelcomePage();
  },
);
Handler loginPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return LoginPage();
  },
);
