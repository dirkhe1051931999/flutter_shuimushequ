import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/page/home/album_post_widget.dart';

Widget postWidget({
  dynamic posts,
  bool isPictureMode = false,
  String categoriesType,
  String categoriesId,
  Function onTap,
  Function onTapImage,
  Function onTapBoard,
}) {
  List adList = posts['data']['adList'];
  List topics = posts['data']['topics'];
  List<Widget> _posts = [];
  for (var i = 0; i < topics.length; i++) {
    dynamic item = topics[i];
    DateTime lastPostTime =
        DateTime.fromMillisecondsSinceEpoch(item['lastPostTime']);
    List albums = item['article']['attachments'];
    List<Widget> _albums = [];
    String userAvatar = item['article']['account']['avatarUrl'];
    String username = item['article']['account']['name'];
    if (albums.length > 6) {
      albums.removeRange(5, albums.length - 1);
    }
    for (var j = 0; j < albums.length; j++) {
      _albums.add(albumWidget(albums[j], (item) {
        return onTapImage(j, albums);
      }));
    }
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
              Wrap(
                spacing: duSetWidth(4),
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item['subject'],
                      style: TextStyle(
                        fontSize: duSetFontSize(17),
                        fontFamily: 'Montserrat',
                        color: AppColors.fontBlack,
                      ),
                      children: [
                        if (!isPictureMode &&
                            item['article']['attachments'].length != 0)
                          WidgetSpan(
                            child: Icon(
                              Icons.image_sharp,
                              size: duSetFontSize(20),
                              color: AppColors.fontBlue,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
              if (isPictureMode && item['article']['attachments'].length == 0)
                Text(
                  item['article']['body'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: duSetFontSize(14),
                    fontFamily: 'Montserrat',
                    color: AppColors.mainTitleGrey,
                  ),
                ),
              if (isPictureMode && item['article']['attachments'].length != 0)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: duSetHeight(5)),
                  child: Wrap(
                    spacing: duSetWidth(4),
                    runSpacing: duSetHeight(5),
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.center,
                    children: _albums,
                  ),
                ),
              Container(
                height: duSetHeight(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (isPictureMode)
                    ClipRRect(
                      borderRadius: Radii.k6pxRadius,
                      child: Image.network(
                        userAvatar + '?w=80&h=80',
                        width: duSetWidth(16),
                        height: duSetHeight(16),
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (isPictureMode)
                    Padding(
                      padding: EdgeInsets.only(
                        left: duSetWidth(
                          5,
                        ),
                        right: duSetWidth(
                          25,
                        ),
                      ),
                      child: Text(
                        username,
                        style: TextStyle(
                          fontSize: duSetFontSize(14),
                          fontFamily: 'Montserrat',
                          color: AppColors.fontBlack,
                        ),
                      ),
                    ),
                  if (isPictureMode)
                    Padding(
                      padding: EdgeInsets.only(right: duSetWidth(2)),
                      child: Icon(
                        Icons.comment,
                        size: duSetFontSize(15),
                        color: AppColors.bgBlue,
                      ),
                    ),
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
                  if (isPictureMode)
                    Padding(
                      padding: EdgeInsets.only(right: duSetWidth(2)),
                      child: Icon(
                        Icons.favorite,
                        size: duSetFontSize(15),
                        color: AppColors.bgBlue,
                      ),
                    ),
                  Text(
                    (item['likeAvailables']).toString() + ' 喜欢',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  if (isPictureMode)
                    Padding(
                      padding: EdgeInsets.only(right: duSetWidth(2)),
                      child: Icon(
                        Icons.timer,
                        size: duSetFontSize(15),
                        color: AppColors.bgBlue,
                      ),
                    ),
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
                    flex: 0,
                    child: InkWell(
                      onTap: () => onTapBoard(item),
                      child: Text(
                        item['board']['title'] ?? '水木社区',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.fontBlue,
                          fontSize: duSetFontSize(12),
                          fontFamily: 'Avenir',
                        ),
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
