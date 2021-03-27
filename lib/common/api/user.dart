import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/user/my.dart';
import 'package:shuimushequ/common/utils/index.dart';

class UserAPI {
  static Future<dynamic> login({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().post(
      '/authorize/sign-in',
      context: context,
      params: params,
    );
    return res;
  }

  static Future logout({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().post(
      '/authorize/sign-out',
      context: context,
      params: params,
    );
    return res;
  }

  static Future<TypeMyResponse> mySettings({
    @required BuildContext context,
  }) async {
    var res = await HttpUtil().get(
      'api/profile/setting/my',
      context: context,
    );
    return TypeMyResponse.fromJson(res);
  }
}
