import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/hot/ten.dart';
import 'package:shuimushequ/common/type/hot/board.dart';
import 'package:shuimushequ/common/utils/index.dart';

class HotAPI {
  // board
  static Future<TypeHotBoardResponse> getHotBoardList({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'hot/popularity/board',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeHotBoardResponse.fromJson(res);
  }

  // post
  static Future<TypeHotTenResponse> getHotTenList({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'hot/ten',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeHotTenResponse.fromJson(res);
  }
}
