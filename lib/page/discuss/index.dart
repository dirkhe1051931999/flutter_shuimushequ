import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/discuss.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/type/discuss/section.dart';
import 'package:shuimushequ/common/type/discuss/section_detail.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/discuss/section_widget.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 返回true
  AppState _appState;
  TypeDiscussSectionResponse _allSection;
  TypeDiscussSectionDetailResponse _sectionDetail;
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    print('discuss init');
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_DISCUSS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadAllData() async {
    _allSection = await DiscussAPI.getSections(
      context: context,
    );
    String id = _allSection.data.toJson()['sections'][0]['id'];
    _sectionDetail =
        await DiscussAPI.getSectionDetail(context: context, params: {"id": id});
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildSection() {
    return _allSection == null
        ? Container()
        : SectionWidget(
            discuss: _allSection,
            onTap: (item) {
              print(item);
            },
          );
  }

  Widget _buildSectionDetail() {
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);

    return _allSection == null || _sectionDetail == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(
              infoColor: AppColors.fontBlack,
              infoText: 'Update at ${duTimeLineFormat2(DateTime.now())}',
            ),
            // onRefresh: () async {
            //   return true;
            // },
            child: SingleChildScrollView(
              child: Container(
                color: AppColors.bgGrey,
                child: Column(
                  children: <Widget>[
                    _buildSection(),
                    _buildSectionDetail(),
                  ],
                ),
              ),
            ),
          );
  }
}
