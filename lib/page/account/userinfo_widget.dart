import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';

Widget userInfoWidget({dynamic account}) {
  // 图像
  String avatarUrl = account['k3sUrl'];
  // 名字
  String name = account['name'];
  // 昵称
  String nick = account['nick'];
  // 等级
  int level = account['level'];
  // 粉丝
  int fansCount = account['fansCount'];
  // 关注
  int friendCount = account['friendCount'];
  // 注册时间
  DateTime createTime =
      DateTime.fromMillisecondsSinceEpoch(account['createTime']);
  // 距今多少天
  DateTime now = DateTime.now();
  int distanceDay = now.difference(createTime).inDays;
  // 积分
  int score = account['score'];
  // 性别 0是女，1是男
  int sex = account['gender'];
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.network(
            avatarUrl + '?w=180&h=180',
            width: duSetWidth(48),
            height: duSetHeight(48),
          ),
        ),
        Container(
          height: duSetHeight(5),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                color: AppColors.white,
                fontSize: duSetFontSize(20),
                fontFamily: 'Montserrat',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: duSetWidth(10)),
              child: Text(
                sex == 0 ? '（小姐姐）' : '（小哥哥）',
                style: TextStyle(
                  color: sex == 0 ? Colors.pink[50] : Colors.blue[50],
                  fontSize: duSetFontSize(10),
                  fontFamily: 'Montserrat',
                  height: 1,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '昵称: $nick',
              style: TextStyle(
                color: AppColors.white,
                fontSize: duSetFontSize(10),
                fontFamily: 'Montserrat',
              ),
            )
          ],
        ),
        Container(
          height: duSetHeight(8),
        ),
        Row(
          children: [
            Text(
              '等级：$level',
              style: TextStyle(
                color: AppColors.white,
                fontSize: duSetFontSize(10),
                fontFamily: 'Montserrat',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
              child: Text(
                '积分：$score',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: duSetFontSize(10),
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Text(
              '已加入 $distanceDay 天',
              style: TextStyle(
                color: AppColors.white,
                fontSize: duSetFontSize(10),
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
        Container(
          height: duSetHeight(8),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friendCount.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: duSetFontSize(10),
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  '关注',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: duSetFontSize(10),
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
            Container(
              width: duSetHeight(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fansCount.toString(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: duSetFontSize(10),
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  '被关注',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: duSetFontSize(10),
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
