import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/text_limt_display.dart';

Widget timeLineWidget({dynamic content}) {
  List<Widget> _comment = [];
  print(content.length);
  for (var i = 0; i < content.length; i++) {
    dynamic item = content[i];
    String body = item['body'];
    String replyHtml = body.replaceAll(
        new RegExp(r'''(<div class=\"article-quote\"> (.*?)</div>")'''), '');
    String replyString = parse(replyHtml).body.text;
    int index = replyString.indexOf('【');
    String currentUserReply;
    String othersUserReply = '';
    if (index != -1) {
      currentUserReply = replyString.substring(0, index);
      othersUserReply = replyString.substring(index);
    } else {
      currentUserReply = replyString;
    }
    DateTime commentTime =
        DateTime.fromMillisecondsSinceEpoch(item['postTime']);
    _comment.add(
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: duSetWidth(10),
          vertical: duSetHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: Radii.k6pxRadius,
        ),
        margin: EdgeInsets.only(
          left: duSetWidth(15),
          right: duSetWidth(15),
          bottom: duSetHeight(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (othersUserReply != '')
              Container(
                width: duSetWidth(330),
                padding: EdgeInsets.symmetric(
                  horizontal: duSetWidth(10),
                  vertical: duSetHeight(10),
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgGrey,
                  borderRadius: Radii.k6pxRadius,
                ),
                margin: EdgeInsets.only(
                  bottom: duSetHeight(10),
                ),
                child: Text(
                  othersUserReply,
                  style: TextStyle(
                    fontSize: duSetFontSize(12),
                    fontFamily: 'Montserrat',
                    color: AppColors.fontBlack,
                  ),
                ),
              ),
            Container(
              child: TextLimitDisplay(
                text: currentUserReply,
                minLines: 3,
                maxLines: 100,
                textStyle: TextStyle(
                  fontSize: duSetFontSize(14),
                  fontFamily: 'Montserrat',
                  color: AppColors.fontBlack,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: duSetHeight(10)),
              child: Row(
                children: [
                  Text(
                    ("${duTimeLineFormat(commentTime)}"),
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    item['board']['title'],
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.fontBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Container(
    margin: EdgeInsets.symmetric(vertical: duSetHeight(10)),
    color: AppColors.bgGrey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: _comment,
    ),
  );
}
