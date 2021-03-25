import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/home/post.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget postWidget({
  TypePostResponse posts,
  String categoriesType,
  String categoriesId,
  Function onTap,
}) {
  // print(posts.);
  List adList = posts.data.toJson()['adList'];
  List topics = posts.data.toJson()['topics'];
  List<Widget> _posts = [];
  for (var i = 0; i < topics.length; i++) {
    dynamic item = topics[i];
    DateTime lastPostTime =
        DateTime.fromMillisecondsSinceEpoch(item['lastPostTime']);
    _posts.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          padding: EdgeInsets.only(
            left: duSetWidth(15),
            right: duSetWidth(15),
            top: duSetHeight(10),
            bottom: duSetHeight(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item['subject'],
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: duSetFontSize(17),
                  fontFamily: 'Montserrat',
                  color: AppColors.fontBlack,
                ),
              ),
              Container(
                height: duSetHeight(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (item['availables'] - 1 == -1 ? 0 : item['availables'] - 1)
                            .toString() +
                        ' 回复',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    (item['likeAvailables']).toString() + ' 喜欢',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    ("${duTimeLineFormat(lastPostTime)}"),
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      item['board']['title'] ?? '',
                      style: TextStyle(
                        color: AppColors.fontBlue,
                        fontSize: duSetFontSize(12),
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: duSetHeight(5),
              ),
              Divider(
                height: 1,
                color: AppColors.borderGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
  return Column(children: _posts);
}
