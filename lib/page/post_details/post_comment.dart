import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shuimushequ/common/type/post_details/comment.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/text_limt_display.dart';

Widget postCommentWidget(
  TypePostDetailsCommentResponse post, {
  Function onTapMore,
  Function onTapReply,
  Function onTapOnlySee,
}) {
  List comments = post.data.toJson()['articles'];
  List<Widget> _comments = [];
  for (var i = 1; i < comments.length; i++) {
    dynamic item = comments[i];
    String userAvatar = item['account']['avatarUrl'];
    String userName = item['account']['name'];
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
    _comments.add(Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipOval(
              child: Image.network(
                userAvatar + '?w=80&h=80',
                width: duSetWidth(18),
                height: duSetHeight(18),
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: duSetWidth(8)),
              child: Text(
                userName,
                style: TextStyle(
                  fontSize: duSetFontSize(12),
                  fontFamily: 'Montserrat',
                  color: AppColors.fontBlack,
                ),
              ),
            ),
            Spacer(),
            Text(
              '${item['topicOrder']} 楼',
              style: TextStyle(
                fontSize: duSetFontSize(12),
                fontFamily: 'Montserrat',
                color: AppColors.subGrey,
              ),
            ),
          ],
        ),
        othersUserReply != ''
            ? Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: duSetWidth(38)),
                    padding: EdgeInsets.symmetric(
                        horizontal: duSetWidth(10), vertical: duSetHeight(10)),
                    width: duSetWidth(300),
                    decoration: BoxDecoration(
                      color: AppColors.bgGrey,
                      borderRadius: Radii.k6pxRadius,
                    ),
                    child: TextLimitDisplay(
                      text: othersUserReply,
                      minLines: 3,
                      maxLines: 10,
                      textStyle: TextStyle(
                        fontSize: duSetFontSize(12),
                        fontFamily: 'Montserrat',
                        color: AppColors.fontBlack,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: duSetWidth(38)),
              padding: EdgeInsets.symmetric(vertical: duSetHeight(5)),
              width: duSetWidth(300),
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
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: duSetWidth(38)),
          child: Row(
            children: <Widget>[
              Text(
                ("${duTimeLineFormat(commentTime)}"),
                style: TextStyle(
                  fontSize: duSetFontSize(12),
                  fontFamily: 'Avenir',
                  color: AppColors.subGrey,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () => onTapMore(item),
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.fontBlue,
                  size: duSetFontSize(14),
                ),
              ),
              TextButton(
                onPressed: () => onTapOnlySee(item),
                child: Text(
                  '只看他',
                  style: TextStyle(
                    fontSize: duSetFontSize(12),
                    fontFamily: 'Avenir',
                    color: AppColors.fontBlue,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => onTapReply(item),
                child: Text(
                  '回复',
                  style: TextStyle(
                    fontSize: duSetFontSize(12),
                    fontFamily: 'Avenir',
                    color: AppColors.fontBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
  return Container(
    padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
    child: Column(
      children: _comments,
    ),
  );
}
