import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/home/categories.dart';
import 'package:shuimushequ/common/type/home/post.dart';
import 'package:shuimushequ/common/utils/index.dart';

class CommunityAPI {
  static Future<TypeCategoriesResponse> getCategories({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'profile/navigation',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeCategoriesResponse.fromJson(res);
  }

  // post
  static Future<TypePostResponse> getPostList({
    @required BuildContext context,
    @required String tabName,
    @required String tabId,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res;
    if (tabName == 'global' /*热帖*/) {
      res = await HttpUtil().get(
        'hot/global',
        context: context,
        refresh: refresh,
        cacheDisk: cacheDisk,
        params: params,
      );
    } else if (tabName == 'album' /*图览*/) {
      res = await HttpUtil().get(
        '/album/load/global',
        context: context,
        refresh: refresh,
        cacheDisk: cacheDisk,
        params: params,
      );
    } else /*其他*/ {
      Map<String, dynamic> param = {};
      Map<String, dynamic> channel = {
        'channel': tabId,
      };
      param.addAll(params);
      param.addAll(channel);
      res = await HttpUtil().get(
        'channel/loadTopics',
        context: context,
        refresh: refresh,
        cacheDisk: cacheDisk,
        params: param,
      );
    }
    return TypePostResponse.fromJson(res);
  }
  // 图览-post
}
