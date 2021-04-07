import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';

Widget albumPostWidget({
  dynamic posts,
  Function onTapImage,
  Function onTapPost,
  Function onTapBoard,
}) {
  dynamic articles = posts['data']['articles'];
  List<Widget> _posts = [];
  for (var i = 0; i < articles.length; i++) {
    dynamic item = articles[i];
    List albums = item['attachments'];
    List<Widget> _albums = [];
    if (albums.length > 6) {
      albums.removeRange(5, albums.length - 1);
    }
    for (var j = 0; j < albums.length; j++) {
      _albums.add(albumWidget(albums[j], (item) {
        return onTapImage(j, albums);
      }));
    }
    DateTime postTime = DateTime.fromMillisecondsSinceEpoch(item['postTime']);
    String userAvatar = item['account']['avatarUrl'];
    String username = item['account']['name'];
    _posts.add(
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: duSetWidth(15),
          vertical: duSetHeight(5),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onTapPost(item),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: duSetHeight(10)),
                child: Text(
                  item['subject'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: duSetFontSize(17),
                    fontFamily: 'Montserrat',
                    color: AppColors.fontBlack,
                    height: 1.2,
                  ),
                ),
              ),
              Wrap(
                spacing: duSetWidth(4),
                runSpacing: duSetHeight(5),
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                children: _albums,
              ),
              Padding(
                padding: EdgeInsets.only(top: duSetHeight(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: Radii.k6pxRadius,
                      child: Image.network(
                        'http://ks3-cn-beijing.ksyun.com/avatar/5db15e1d27ad0ccaa79a6b856fbe9c5f?w=80&h=80',
                        width: duSetWidth(16),
                        height: duSetHeight(16),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: duSetWidth(
                          5,
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: duSetWidth(30),
                      ),
                      child: Text(
                        ("${duTimeLineFormat(postTime)}"),
                        style: TextStyle(
                          fontSize: duSetFontSize(14),
                          fontFamily: 'Montserrat',
                          color: AppColors.subGrey,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => onTapBoard(item),
                      child: Text(
                        item['board']['title'],
                        style: TextStyle(
                          fontSize: duSetFontSize(14),
                          fontFamily: 'Montserrat',
                          color: AppColors.fontBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (i < articles.length) {
      _posts.add(Divider());
    }
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: _posts,
  );
}

Widget albumWidget(dynamic album, Function onTap) {
  return GestureDetector(
    onTap: () => onTap(album),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: Radii.k10pxRadius,
      ),
      child: imageCached(
        url:
            'https://ks3-cn-beijing.ksyun.com/attachment/${album["hash"]}@base@tag=imgScale&w=320&h=320&m=2',
        width: 108,
        height: 108,
      ),
    ),
  );
}
