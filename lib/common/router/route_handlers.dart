import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/account/index.dart';
import 'package:shuimushequ/page/application/index.dart';
import 'package:shuimushequ/page/board/index.dart';
import 'package:shuimushequ/page/login/index.dart';
import 'package:shuimushequ/page/post_details/index.dart';
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
Handler postDetailPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String id = params["id"][0];
    return PostDetailPage(
      id: id,
    );
  },
);
Handler accountPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String id = params["id"][0];
    String name = params["name"][0];
    return AccountPage(
      id: id,
      name: name,
    );
  },
);
Handler boardPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String id = params["id"][0];
    String name = params["name"][0];
    return BoardPage(
      id: id,
      name: name,
    );
  },
);
