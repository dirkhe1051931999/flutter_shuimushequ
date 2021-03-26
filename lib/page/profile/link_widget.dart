import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/screen.dart';
import 'package:shuimushequ/common/values/colors.dart';

Widget LinkWidget(Function onTap) {
  List<Widget> _links = [];
  List links = [
    {
      'route': '/',
      'name': '浏览历史',
    },
    {
      'route': '/',
      'name': '我的收藏',
    },
    {
      'route': '/',
      'name': '我的文章',
    },
    {
      'route': '/',
      'name': '我的黑名单',
    },
    {
      'route': '/',
      'name': '我的草稿',
    },
    {
      'route': '/',
      'name': '我的关注',
    },
    {
      'route': '/',
      'name': '我的粉丝',
    },
    {
      'name': '退出登录',
    },
  ];
  for (var i = 0; i < links.length; i++) {
    dynamic item = links[i];
    _links.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          height: duSetHeight(45),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item['name'],
                style: TextStyle(
                  fontSize: duSetFontSize(18.5),
                  color: i < links.length - 1
                      ? AppColors.fontBlack
                      : AppColors.red,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: HexColor('#cccccc'),
                size: duSetFontSize(20),
              ),
            ],
          ),
        ),
      ),
    );
    if (i < links.length - 1) {
      _links.add(Divider());
    }
  }
  return Padding(
    padding: EdgeInsets.only(
        left: duSetHeight(15), right: duSetHeight(15), bottom: duSetHeight(30)),
    child: Column(
      children: _links,
    ),
  );
}
