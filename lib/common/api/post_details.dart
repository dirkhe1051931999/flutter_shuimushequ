import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/post_details/comment.dart';
import 'package:shuimushequ/common/type/post_details/likes.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/index.dart';

class PostDetailsAPI {
  // post details
  static Future<TypePostDetailsResponse> getPostDetails({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/topic/${params['id']}/detail',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return TypePostDetailsResponse.fromJson(res);
  }

  static Future<TypePostDetailsLikesResponse> getPostDetailsLikes({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/topic/${params['id']}/likes',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return TypePostDetailsLikesResponse.fromJson(res);
  }

  static Future<TypePostDetailsCommentResponse> getPostDetailsComment({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'api/topic/loadArticlesByMode/${params['id']}/${params['mode']}/${params['num']}/${params['size']}',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return TypePostDetailsCommentResponse.fromJson(res);
  }
}
