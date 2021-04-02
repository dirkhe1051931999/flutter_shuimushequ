import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/comment.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/page/post_details/post_comment.dart';

Widget onlySeeWidget(
  TypePostDetailsCommentResponse _onlySeeResponse, {
  Function onTapMore,
  Function onTapReply,
  Function onTapUser,
}) {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: duSetHeight(20),
      ),
      child: postCommentWidget(
        _onlySeeResponse,
        whereFrom: 'onlySee',
        onTapMore: (item) => onTapMore(item),
        onTapReply: (item) => onTapReply(item),
        onTapUser: (item) => onTapUser(item),
      ),
    ),
  );
}
