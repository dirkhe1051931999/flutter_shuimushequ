import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/utils/parse_html.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';

Widget postContentWidget(TypePostDetailsResponse post, {Function onTapImage}) {
  List content =
      collectHtmlPContent(post.data.toJson()['topic']['article']['body']);
  List<String> aHref =
      collectHtmlAHref(post.data.toJson()['topic']['article']['body']);
  List images =
      collectHtmlImageSrc(post.data.toJson()['topic']['article']['body']);
  List attachments = post.data.toJson()['topic']['article']['attachments'];
  List<Widget> pTextImg = [];
  // 文本
  for (var i = 0; i < content.length; i++) {
    pTextImg.add(
      Container(
        child: Text(
          content[i],
          style: TextStyle(
            fontSize: duSetFontSize(21),
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
    padding: EdgeInsets.only(top: duSetHeight(20)),
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
          Divider(),
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
