import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/likes.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget postLikeWidget(
  TypePostDetailsLikesResponse post,
  bool _getMoreLikes, {
  Function onTapLike,
  Function onTapMore,
}) {
  List likeArr = post.data.toList()[1];
  List allLikes = post.data.toList()[1];
  List likes = !_getMoreLikes ? likeArr.take(3).toList() : allLikes;

  List<Widget> _likes = [];
  _likes.add(
    Container(
      width: duSetWidth(68),
      margin: EdgeInsets.symmetric(vertical: duSetHeight(10)),
      child: TextButton(
        clipBehavior: Clip.hardEdge,
        style: TextButton.styleFrom(
          primary: AppColors.fontBlue,
          backgroundColor: AppColors.white,
          elevation: 0,
          side: BorderSide(color: HexColor('#0097e5'), width: duSetWidth(1)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          "Like",
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: duSetFontSize(14),
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () => onTapLike('like'),
      ),
    ),
  );
  for (var i = 0; i < likes.length; i++) {
    dynamic item = likes[i];
    String comment = item['account']['name'] + ': ' + item['body'];
    int score = item['score'];
    _likes.add(
      Padding(
        padding: EdgeInsets.only(bottom: duSetHeight(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: duSetWidth(5)),
              padding: EdgeInsets.symmetric(
                horizontal: duSetWidth(3),
                vertical: duSetHeight(2),
              ),
              width: duSetWidth(35),
              decoration: BoxDecoration(
                color: score > 0 ? HexColor('#faeeee') : HexColor('#f5f5f5'),
                borderRadius: Radii.k10pxRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/${score > 0 ? '+' + score.toString() : score}.png',
                    width: duSetWidth(14),
                    height: duSetHeight(14),
                  ),
                  Text(
                    '${score > 0 ? '+' + score.toString() : score}',
                    style: TextStyle(
                      color: score > 0 ? AppColors.red : AppColors.subGrey,
                      fontFamily: 'Avenir',
                      fontSize: duSetFontSize(10),
                      height: 1.3,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: duSetWidth(280),
              child: Text(
                comment,
                style: TextStyle(
                  color: AppColors.fontBlack,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(12),
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  if (allLikes.length > 3) {
    _likes.add(
      Container(
        child: TextButton(
          clipBehavior: Clip.hardEdge,
          style: TextButton.styleFrom(
            primary: AppColors.fontBlue,
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                !_getMoreLikes ? '${allLikes.length + 1} 人参与，去看看' : '收起',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fontBlue,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(12),
                  height: 1.3,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: duSetFontSize(12),
                color: AppColors.fontBlue,
              )
            ],
          ),
          onPressed: () => onTapMore('more'),
        ),
      ),
    );
  }
  return Container(
    padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
    child: Column(
      children: _likes,
    ),
  );
}
