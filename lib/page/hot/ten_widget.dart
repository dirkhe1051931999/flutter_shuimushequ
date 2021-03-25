import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/hot/ten.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget HotTenWidget({
  TypeHotTenResponse posts,
  Function onTap,
}) {
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
              Container(
                padding: EdgeInsets.only(bottom: duSetHeight(5)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Stack(
                        children: [
                          Positioned(
                            child: Icon(
                              Iconfont.duobianxing,
                              color: i == 0
                                  ? Color.fromRGBO(255, 206, 50, 1.000)
                                  : i == 1
                                      ? Color.fromRGBO(184, 188, 228, 1.000)
                                      : i == 2
                                          ? Color.fromRGBO(215, 149, 125, 1.000)
                                          : AppColors.tabBarElement,
                            ),
                          ),
                          Positioned(
                            top: i <= 2 ? duSetHeight(5) : duSetHeight(3),
                            left: i == 9 ? duSetWidth(3) : duSetWidth(7),
                            child: Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          i <= 2
                              ? Positioned(
                                  top: duSetHeight(-7),
                                  left: duSetHeight(2),
                                  child: Icon(
                                    Iconfont.king,
                                    color: i == 0
                                        ? Color.fromRGBO(244, 129, 35, 1.000)
                                        : i == 1
                                            ? Color.fromRGBO(
                                                134, 140, 193, 1.000)
                                            : i == 2
                                                ? Color.fromRGBO(
                                                    236, 191, 175, 1.000)
                                                : AppColors.tabBarElement,
                                    size: duSetFontSize(18),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: duSetWidth(25)),
                      child: Text(
                        item['subject'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: duSetFontSize(17),
                          fontFamily: 'Montserrat',
                          color: AppColors.fontBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: duSetWidth(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (item['availables'] - 1 == -1
                                  ? 0
                                  : item['availables'] - 1)
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
                    Text(
                      item['board']['title'] ?? '',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.fontBlue,
                        fontSize: duSetFontSize(12),
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ],
                ),
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
