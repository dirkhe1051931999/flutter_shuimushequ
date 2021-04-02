import 'package:flutter/material.dart';
import 'package:shuimushequ/common/values/colors.dart';

Widget userInfoWidget({dynamic account}) {
  print(account);
  String avatarUrl = account['k3sUrl'];
  String name = account['name'];
  String nick = account['nick'];
  int level = account['level'];
  return Container(
    child: Text(
      '123',
      style: TextStyle(color: AppColors.white),
    ),
  );
}
