import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';

Widget BoxWidget(Function onTap, {bool isSunDay, bool isPictureMode}) {
  List boxs = [
    {
      "name": '收件箱',
      "icon": Icon(
        Icons.mail,
        color: HexColor('#0097e5'),
      ),
      "route": '/',
    },
    {
      "name": '回复我的',
      "icon": Icon(
        Icons.mark_chat_unread,
        color: HexColor('#15cebf'),
      ),
      "route": '/',
    },
    {
      "name": '@我的',
      "icon": Icon(
        Icons.notifications_active_rounded,
        color: HexColor('#f86767'),
      ),
      "route": '/',
    },
    {
      "name": '喜欢我',
      "icon": Icon(
        Icons.thumb_up_alt,
        color: HexColor('#15cebf'),
      ),
      "route": '/',
    },
    {
      "name": '意见反馈',
      "icon": Icon(
        Icons.feedback,
        color: HexColor('#f86767'),
      ),
    },
    {
      "name": '字体大小',
      "icon": Icon(
        Icons.text_rotation_none,
        color: HexColor('#f86767'),
      ),
    },
  ];
  !isSunDay
      ? boxs.add({
          "name": '白天模式',
          "icon": Icon(
            Icons.wb_sunny,
            color: HexColor('#ffa400'),
          ),
          "isSunDay": true
        })
      : boxs.add({
          "name": '黑夜模式',
          "icon": Icon(
            Icons.brightness_2,
            color: HexColor('#999999'),
          ),
          "isSunDay": false
        });
  !isPictureMode
      ? boxs.add({
          "name": '图片模式',
          "icon": Icon(
            Icons.image,
            color: HexColor('#15cebf'),
          ),
          "isPictureMode": true,
        })
      : boxs.add({
          "name": '文字模式',
          "icon": Icon(
            Icons.text_fields,
            color: HexColor('#f86767'),
          ),
          "isPictureMode": false,
        });
  List<Widget> children = [];
  for (var i = 0; i < boxs.length; i++) {
    dynamic item = boxs[i];
    children.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: duSetWidth(40),
              height: duSetWidth(40),
              decoration: BoxDecoration(
                color: AppColors.bgGrey,
                borderRadius: BorderRadius.circular(40),
              ),
              child: item['icon'],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: duSetHeight(10),
              ),
              child: Text(
                item['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fontBlack,
                  fontSize: item['name'].length == 3
                      ? duSetFontSize(15)
                      : duSetFontSize(12),
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: duSetHeight(15),
      horizontal: duSetHeight(15),
    ),
    child: Wrap(
      spacing: duSetWidth(20),
      runSpacing: duSetWidth(20),
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      children: children,
    ),
  );
}
