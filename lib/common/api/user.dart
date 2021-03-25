import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/index.dart';
import 'package:shuimushequ/common/utils/index.dart';

class UserApi {
  static Future<TypeLoginResponse> login({
    @required BuildContext context,
    TypeLoginRequest params,
  }) async {
    var res = await HttpUtil().post(
      '/user/login',
      context: context,
      params: params,
    );
    return TypeLoginResponse.fromJson(res);
  }

  static Future logout({
    @required BuildContext context,
    params,
  }) async {
    var res = await HttpUtil().post(
      '/user/login',
      context: context,
      params: params,
    );
    return res;
  }
}
