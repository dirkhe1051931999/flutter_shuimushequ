import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:shuimushequ/common/router/route_handlers.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String welcome = '/welcome';
  static String postDetailsPage = '/post_details/:id';
  static String imageView = '/imageView';
  static String search = '/search';
  static String account = '/account/:id/:name';
  static String board = '/board/:id/:name';
  static String board_search = '/board_search/:id/:name';
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return;
      },
    );
    router.define(root, handler: applicationHandler);
    router.define(imageView, handler: imageViewHandler);
    router.define(search, handler: searchPageHandler);
    router.define(login, handler: loginPageHandler);
    router.define(welcome, handler: welcomePageHandler);
    router.define(postDetailsPage, handler: postDetailPageHandler);
    router.define(account, handler: accountPageHandler);
    router.define(board, handler: boardPageHandler);
    router.define(board_search, handler: boardSearchPageHandler);
  }
}
