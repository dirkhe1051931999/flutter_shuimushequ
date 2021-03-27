import 'package:flutter/material.dart';
import 'package:html/parser.dart';
// import 'package:html/dom.dart';
import 'package:shuimushequ/common/type/search/articles.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget articleWidget({
  TypeSearchArticleResponse articles,
  Function onTapArticle,
  Function onTapBoard,
}) {
  List<Widget> _articles = [];
  List result = articles.data.toJson()['articles'];

  for (var i = 0; i < result.length; i++) {
    dynamic item = result[i];
    dynamic documentSubject = parse(item['subject']);
    int availables = item['topic'] == null
        ? 0
        : item['topic']['availables'] - 1 == -1
            ? 0
            : item['topic']['availables'] - 1;
    DateTime lastPostTime = item['topic'] == null
        ? DateTime.fromMillisecondsSinceEpoch(0)
        : DateTime.fromMillisecondsSinceEpoch(item['topic']['lastPostTime']);
    String board = item['board'] == null ? '' : item['board']['title'];
    _articles.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTapArticle(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: duSetHeight(5)),
              child: Text(
                documentSubject.body.text,
                style: TextStyle(
                  fontSize: duSetFontSize(17),
                  fontFamily: 'Montserrat',
                  color: AppColors.fontBlack,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: duSetHeight(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    availables.toString() + ' 回复',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      ("${duTimeLineFormat(lastPostTime)}"),
                      style: TextStyle(
                        fontSize: duSetFontSize(12),
                        fontFamily: 'Avenir',
                        color: AppColors.subGrey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: GestureDetector(
                      onTap: () => onTapBoard(item),
                      child: Text(
                        board,
                        style: TextStyle(
                          fontSize: duSetFontSize(12),
                          fontFamily: 'Avenir',
                          color: AppColors.fontBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    if (i < result.length - 1) {
      _articles.add(Divider());
    }
  }
  return Padding(
    padding: EdgeInsets.only(bottom: duSetHeight(10)),
    child: Column(
      children: _articles,
    ),
  );
}
