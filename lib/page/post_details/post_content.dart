import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/utils/parse_html.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';

Widget postContentWidget(
  TypePostDetailsResponse post, {
  Function onTapImage,
  Function onTapUser,
}) {
  List content =
      collectHtmlPContent(post.data.toJson()['topic']['article']['body']);
  List<String> aHref =
      collectHtmlAHref(post.data.toJson()['topic']['article']['body']);
  List images =
      collectHtmlImageSrc(post.data.toJson()['topic']['article']['body']);
  List attachments = post.data.toJson()['topic']['article']['attachments'];
  List<Widget> pTextImg = [];
  String userAvatar =
      post.data.toJson()['topic']['article']['account']['avatarUrl'];
  String userId = post.data.topic.article.account.id;
  String name = post.data.toJson()['topic']['article']['account']['name'];
  DateTime postTime = DateTime.fromMillisecondsSinceEpoch(
    post.data.toJson()['topic']['article']['postTime'],
  );
  // 标题
  pTextImg.add(
    Container(
      child: Text(
        "『 " + post.data.toJson()['topic']['article']['subject'] + " 』",
        style: TextStyle(
          fontSize: duSetFontSize(16),
          fontFamily: 'Montserrat',
          color: AppColors.fontBlack,
          height: 1.2,
        ),
      ),
    ),
  );
  // account
  pTextImg.add(
    Container(
      padding: EdgeInsets.symmetric(vertical: duSetHeight(10)),
      child: Row(
        children: [
          InkWell(
            onTap: () => onTapUser(userId, name),
            child: ClipRRect(
              borderRadius: Radii.k10pxRadius,
              child: Image.network(
                userAvatar + '?w=80&h=80',
                width: duSetWidth(18),
                height: duSetHeight(18),
              ),
            ),
          ),
          InkWell(
            onTap: () => onTapUser(userId, name),
            child: Padding(
              padding: EdgeInsets.only(
                left: duSetWidth(5),
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: duSetFontSize(12),
                  fontFamily: 'Montserrat',
                  color: AppColors.fontBlack,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            ("${duTimeLineFormat(postTime)}"),
            style: TextStyle(
              fontSize: duSetFontSize(12),
              fontFamily: 'Avenir',
              color: AppColors.subGrey,
            ),
          ),
        ],
      ),
    ),
  );
  // 文本
  for (var i = 0; i < content.length; i++) {
    pTextImg.add(
      Container(
        child: Text(
          content[i],
          style: TextStyle(
            fontSize: duSetFontSize(14),
            fontFamily: 'Montserrat',
            color: AppColors.fontBlack,
            height: 1.6,
          ),
        ),
      ),
    );
  }
  // href
  for (var i = 0; i < aHref.length; i++) {
    pTextImg.add(
      Container(
        child: Text(
          aHref[i],
          style: TextStyle(
            fontSize: duSetFontSize(14),
            fontFamily: 'Montserrat',
            color: AppColors.fontBlue,
          ),
        ),
      ),
    );
  }
  // 图片
  // for (var i = 0; i < images.length; i++) {
  //   pTextImg.add(Image.network(images[i]));
  // }
  // 图片,，可以预览
  for (var i = 0; i < attachments.length; i++) {
    pTextImg
        .add(albumWidget(attachments[i], (item) => onTapImage(attachments, i)));
  }
  return Container(
    padding: EdgeInsets.only(
      top: duSetHeight(20),
      left: duSetWidth(15),
      right: duSetWidth(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pTextImg,
    ),
  );
}

Widget albumWidget(dynamic images, Function onTap) {
  return GestureDetector(
    onTap: () => onTap(images),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRadius,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: duSetHeight(10),
          ),
          imageCached(
            url:
                'https://ks3-cn-beijing.ksyun.com/attachment/${images["hash"]}@base@tag=imgScale&w=320&h=320&m=2',
            defaultImage: false,
          ),
        ],
      ),
    ),
  );
}
