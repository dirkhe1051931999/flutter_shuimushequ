import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/search/account.dart';
import 'package:shuimushequ/common/type/search/articles.dart';
import 'package:shuimushequ/common/type/search/board.dart';
import 'package:shuimushequ/common/utils/index.dart';

class SearchAPI {
  // article
  static Future<TypeSearchArticleResponse> searchArticleData({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/search/article',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeSearchArticleResponse.fromJson(res);
  }

  // account
  static Future<TypeSearchAccountResponse> searchAccountData({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/search/account',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeSearchAccountResponse.fromJson(res);
  }

  // board
  static Future<TypeSearchBoardResponse> searchBoardData({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/search/board',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeSearchBoardResponse.fromJson(res);
  }
}
