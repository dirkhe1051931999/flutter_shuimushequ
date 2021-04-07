import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/discuss.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/type/discuss/section.dart';
import 'package:shuimushequ/common/type/discuss/section_detail.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/discuss/hot.dart';
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
  double _mediaHeight;
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

  Widget _buildSection(double height) {
    return _allSection == null
        ? Container()
        : SectionWidget(
            discuss: _allSection,
            id: _sectionId,
            height: _mediaHeight,
            onTap: (item) async {
              _sectionId = item['id'];
              _sectionDetail = await DiscussAPI.getSectionDetail(
                context: context,
                params: {"id": _sectionId},
              );
              this._scrollToTop();
              if (mounted) {
                setState(() {});
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
              if (item['type'] == 0) {
                Application.router.navigateTo(
                    context, '/board/${item['id']}/${item['title']}');
              }
            },
            onTapHot: (item) async {
              dynamic index = _allSection.data.sections.indexWhere((item) {
                return item.id == _sectionId;
              });
              SmartDialog.showLoading();
              dynamic data = await DiscussAPI.getSectionDetailHot(
                context: context,
                params: {
                  "id": _allSection.data.sections[index].id,
                  "page": 1,
                },
              );
              await SmartDialog.show(
                alignmentTemp: Alignment.bottomCenter,
                clickBgDismissTemp: true,
                widget: Container(
                  height: duSetHeight(600),
                  width: duSetWidth(350),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: hotWidget(
                    data,
                    _allSection.data.sections[index].name,
                    onTap: (item) async {
                      await SmartDialog.dismiss();
                      Application.router
                          .navigateTo(context, '/post_details/${item['id']}');
                    },
                    onTapBoard: (item) async {
                      await SmartDialog.dismiss();
                      Application.router.navigateTo(context,
                          '/board/${item['board']['id']}/${item['board']['title']}');
                    },
                  ),
                ),
              );
              SmartDialog.dismiss();
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    _mediaHeight = MediaQuery.of(context).size.height;
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
                child: _buildSection(_mediaHeight),
              ),
            ],
          );
  }
}
