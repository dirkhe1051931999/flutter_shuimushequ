import 'package:flutter/cupertino.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/global.dart';

Future<bool> isAuthenticated() async {
  var profileJson = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJson != null ? true : false;
}

Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = {
    "sign-time": 0,
    "set_identity": null,
    "kbs-info": null,
    "kbs-key": null,
  };
  Global.isOfflineLogin = false;
}

Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Application.router.navigateTo(context, '/login');
}
