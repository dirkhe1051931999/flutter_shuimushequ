import 'package:flutter/material.dart';
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
}
