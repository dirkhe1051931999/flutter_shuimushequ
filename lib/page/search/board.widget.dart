import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shuimushequ/common/type/search/board.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget boardWidget({
  TypeSearchBoardResponse boards,
  Function onTap,
}) {
  List<Widget> _boards = [];
  List result = boards.toJson()['data'];
  for (var i = 0; i < result.length; i++) {
    dynamic item = result[i];
    String title = parse(item['title']).body.text;
    dynamic topicCount = '主题: ' + item['topicCount'].toString() ?? '0';
    dynamic articleCount = '文章: ' + item['articleCount'].toString() ?? '0';
    _boards.add(
      GestureDetector(
        onTap: () => onTap(item),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: duSetHeight(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: duSetHeight(5)),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: duSetFontSize(17),
                    fontFamily: 'Montserrat',
                    color: AppColors.fontBlack,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: duSetWidth(5),
                    ),
                    child: Text(
                      topicCount,
                      style: TextStyle(
                        fontSize: duSetFontSize(14),
                        fontFamily: 'Montserrat',
                        color: AppColors.subGrey,
                      ),
                    ),
                  ),
                  Text(
                    articleCount,
                    style: TextStyle(
                      fontSize: duSetFontSize(14),
                      fontFamily: 'Montserrat',
                      color: AppColors.subGrey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    if (i < result.length - 1) {
      _boards.add(Divider());
    }
  }
  return Padding(
    padding: EdgeInsets.only(bottom: duSetHeight(10)),
    child: Column(
      children: _boards,
    ),
  );
}
