import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget postAccountWidget(
  TypePostDetailsResponse post,
) {
  String userAvatar =
      post.data.toJson()['topic']['article']['account']['avatarUrl'];
  String name = post.data.toJson()['topic']['article']['account']['name'];
  DateTime postTime = DateTime.fromMillisecondsSinceEpoch(
    post.data.toJson()['topic']['article']['postTime'],
  );
  return Row(
    children: [
      ClipRRect(
        borderRadius: Radii.k10pxRadius,
        child: Image.network(
          userAvatar + '?w=80&h=80',
          width: duSetWidth(18),
          height: duSetHeight(18),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: duSetWidth(5),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: duSetFontSize(12),
            fontFamily: 'Montserrat',
            color: AppColors.fontBlack,
          ),
        ),
      ),
      Spacer(),
      Text(
        ("${duTimeLineFormat(postTime)}"),
        style: TextStyle(
          fontSize: duSetFontSize(12),
          fontFamily: 'Avenir',
          color: AppColors.subGrey,
        ),
      ),
    ],
  );
}
