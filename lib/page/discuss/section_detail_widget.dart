import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/discuss/section_detail.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget SectionDetailWidget({
  TypeDiscussSectionDetailResponse discussDetail,
  Function onTap,
  Function onTapHot,
}) {
  List<Widget> _discussDetail = [];
  List boards = discussDetail.data.toJson()['boards'];
  _discussDetail.add(
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTapHot('today hot'),
      child: Container(
        width: duSetWidth(235),
        height: duSetHeight(50),
        margin: EdgeInsets.only(bottom: duSetWidth(10)),
        padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: Radii.k6pxRadius,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.memory(
              base64.decode(
                'data:image/png;base64,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'
                    .split(',')[1],
              ),
              height: duSetHeight(14), //设置高度
              width: duSetWidth(72), //设置宽度
              fit: BoxFit.fill, //填充
              gaplessPlayback: true, //防止重绘
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: HexColor('#cccccc'),
              size: duSetFontSize(20),
            ),
          ],
        ),
      ),
    ),
  );
  for (var i = 0; i < boards.length; i++) {
    dynamic item = boards[i];
    _discussDetail.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          width: duSetWidth(235),
          padding: EdgeInsets.symmetric(
            horizontal: duSetWidth(15),
            vertical: duSetHeight(15),
          ),
          margin: EdgeInsets.only(bottom: duSetWidth(10)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: Radii.k6pxRadius,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: duSetFontSize(14),
                          color: AppColors.fontBlack,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      item['type'] != 0
                          ? Container(
                              padding: EdgeInsets.all(duSetWidth(2)),
                              margin: EdgeInsets.only(left: duSetWidth(5)),
                              decoration: BoxDecoration(
                                color: AppColors.bgBlue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                              ),
                              child: Text(
                                '目录',
                                style: TextStyle(
                                  fontSize: duSetFontSize(10),
                                  color: AppColors.white,
                                  fontFamily: 'Avenir',
                                  height: 1.1,
                                ),
                              ),
                            )
                          : Container(
                              width: duSetWidth(54.5),
                              padding: EdgeInsets.only(left: duSetWidth(5)),
                              child: Text(
                                item['name'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: duSetFontSize(12),
                                  color: AppColors.subGrey,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                            ),
                    ],
                  ),
                  item['type'] == 0
                      ? Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: duSetHeight(10),
                              ),
                              child:
                                  Text('今日文章 ${item["todayPostCount"] ?? ""}'),
                            )
                          ],
                        )
                      : Text(''),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: HexColor('#cccccc'),
                size: duSetFontSize(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return Column(
    children: _discussDetail,
  );
}
