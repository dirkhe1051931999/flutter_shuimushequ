import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/discuss/section.dart';
import 'package:shuimushequ/common/type/discuss/section_detail.dart';
import 'package:shuimushequ/common/utils/index.dart';

class DiscussAPI {
  // section
  static Future<TypeDiscussSectionResponse> getSections({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'section/all',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeDiscussSectionResponse.fromJson(res);
  }

  // section detail
  static Future<TypeDiscussSectionDetailResponse> getSectionDetail({
    @required BuildContext context,
    bool refresh = false,
    bool cacheDisk = false,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil().get(
      'section/subs',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      params: params,
    );
    return TypeDiscussSectionDetailResponse.fromJson(res);
  }
}
