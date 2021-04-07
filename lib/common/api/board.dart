import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/index.dart';

class BoardAPI {
  // board
  static Future getBoardDetails({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/board/topic/list',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return res;
  }

  static Future getBoardManager({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/board/manager/list/${params['id']}',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return res;
  }

  static Future getBoardEssence({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/board/load/essence/${params['id']}/${params['pageNum']}/20',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return res;
  }

  static Future getBoardTop({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/board/load/top/${params['id']}/${params['pageNum']}/20',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return res;
  }
}
