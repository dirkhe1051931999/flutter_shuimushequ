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
import 'package:shuimushequ/page/discuss/section_detail_widget.dart';
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
  String _sectionId = '7fba65e45f678eb8c605d4107de04185';
  AppState _appState;
  TypeDiscussSectionResponse _allSection;
  TypeDiscussSectionDetailResponse _sectionDetail;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    print('discuss init');
    _loadAllData();
  }

  _loadAllData() async {
    _allSection = await DiscussAPI.getSections(
      context: context,
    );
    String id = _allSection.data.toJson()['sections'][0]['id'];
    _sectionId = id;
    _sectionDetail = await DiscussAPI.getSectionDetail(
      context: context,
      params: {"id": _sectionId},
    );
    if (mounted) {
      setState(() {});
    }
  }

  void _scrollToTop() {
    scrollController.jumpTo(scrollController.position.minScrollExtent);
  }

  Widget _buildSection() {
    return _allSection == null
        ? Container()
        : SectionWidget(
            discuss: _allSection,
            id: _sectionId,
            onTap: (item) async {
              print(item);
              _sectionId = item['id'];
              _sectionDetail = await DiscussAPI.getSectionDetail(
                context: context,
                params: {"id": _sectionId},
              );
              if (mounted) {
                setState(() {
                  this._scrollToTop();
                });
              }
            },
          );
  }

  Widget _buildSectionDetail() {
    return _sectionDetail == null
        ? Container()
        : SectionDetailWidget(
            discussDetail: _sectionDetail,
            onTap: (item) {
              print(item);
            },
            onTapHot: (item) {
              print('today hot');
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);

    return _allSection == null || _sectionDetail == null
        ? cardListSkeleton()
        : Stack(
            children: <Widget>[
              Positioned(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.only(right: duSetWidth(15)),
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[_buildSectionDetail()],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: _buildSection(),
              ),
            ],
          );
  }
}
