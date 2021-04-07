import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shuimushequ/common/api/board.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/board/list_widget.dart';

class BoardPage extends StatefulWidget {
  final String id;
  final String name;
  BoardPage({Key key, this.id, this.name}) : super(key: key);

  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage>
    with SingleTickerProviderStateMixin {
  int pageNum = 1;
  int pageSize = 20;
  bool isNoMoreData = false;
  bool isMoreDataing = false;
  bool isRefreshing = false;
  ScrollController _scrollController = ScrollController();
  TabController _tabController;
  EasyRefreshController _easyRefreshController = EasyRefreshController();
  dynamic _boardDetail;
  dynamic _boardHeader;
  dynamic _boardManager;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _tabIndex);
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isNoMoreData &&
          !isMoreDataing &&
          !isRefreshing) {
        pageNum++;
        _loadMoreData();
      }
    });
  }

  _getData() async {
    _boardDetail = await BoardAPI.getBoardDetails(
      context: context,
      params: {
        "id": widget.id,
        "isOrderByFlushTime": _tabIndex,
        "page": pageNum
      },
    );
    _boardHeader = _boardDetail['data']['board'];
    _boardManager = await BoardAPI.getBoardManager(context: context, params: {
      "id": widget.id,
    });

    if (mounted) {
      setState(() {});
    }
  }

  _loadMoreData() async {
    SmartDialog.showLoading();
    isMoreDataing = true;
    dynamic more;
    if (_tabIndex < 2) {
      more = await BoardAPI.getBoardDetails(
        context: context,
        params: {
          "id": widget.id,
          "isOrderByFlushTime": _tabIndex,
          "page": pageNum
        },
      );
      _boardDetail['data']['topics'].addAll(more['data']['topics']);
      if (more['data']['topics'].length == 0) {
        isNoMoreData = true;
        SmartDialog.showToast('我也是有底线的~');
      }
    } else if (_tabIndex == 2) {
      more = await BoardAPI.getBoardEssence(
        context: context,
        params: {"id": widget.id, "pageNum": pageNum},
      );
      _boardDetail['data']['articles'].addAll(more['data']['articles']);
      if (more['data']['articles'].length == 0) {
        isNoMoreData = true;
        SmartDialog.showToast('我也是有底线的~');
      }
    } else if (_tabIndex == 3) {
      more = await BoardAPI.getBoardTop(
        context: context,
        params: {"id": widget.id, "pageNum": pageNum},
      );
      _boardDetail['data']['tops'].addAll(more['data']['tops']);
      if (more['data']['tops'].length == 0) {
        isNoMoreData = true;
        SmartDialog.showToast('我也是有底线的~');
      }
    }

    SmartDialog.dismiss();
    isMoreDataing = false;
    if (mounted) {
      setState(() {});
    }
  }

  _loadNewData() async {
    SmartDialog.showLoading();
    if (_tabIndex < 2) {
      _boardDetail = await BoardAPI.getBoardDetails(
        context: context,
        params: {
          "id": widget.id,
          "isOrderByFlushTime": _tabIndex,
          "page": pageNum
        },
      );
    } else if (_tabIndex == 2) {
      _boardDetail = await BoardAPI.getBoardEssence(
        context: context,
        params: {"id": widget.id, "pageNum": pageNum},
      );
    } else if (_tabIndex == 3) {
      _boardDetail = await BoardAPI.getBoardTop(
        context: context,
        params: {"id": widget.id, "pageNum": pageNum},
      );
    }
    SmartDialog.dismiss();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
    _scrollController.dispose();
    _easyRefreshController.dispose();
    _tabController.dispose();
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: true,
      centerTitle: true,
      title: Text(
        widget.name,
        style: TextStyle(
          color: AppColors.white,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(16),
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        color: AppColors.white,
        iconSize: duSetFontSize(25),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: AppColors.white,
          iconSize: duSetFontSize(25),
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.black87,
      expandedHeight: duSetHeight(200),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        background: BackdropFilter(
          //背景滤镜
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 5.0), //背景模糊化
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Opacity(
                    //悬浮的内容
                    opacity: 0.5,
                    child: _boardHeader != null
                        ? Image.network(
                            _boardHeader['section']['cover'],
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                Positioned(
                  left: duSetWidth(15),
                  top: duSetHeight(168),
                  child: _buildBoardInfo(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBoardInfo() {
    return _boardManager != null && _boardHeader != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _boardHeader['name'],
                style: TextStyle(
                  fontSize: duSetFontSize(18),
                  fontFamily: 'Montserrat',
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: duSetHeight(10),
              ),
              Row(
                children: [
                  Text(
                    _boardManager['data'].length > 0 ? '版主' : '招募版主',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Montserrat',
                      color: AppColors.white,
                    ),
                  ),
                  if (_boardManager['data'].length > 0)
                    GestureDetector(
                      onTap: () {
                        // Application.router.navigateTo(context,
                        //     '/account/${_boardManager['data'][0]['id']}/${_boardManager['data'][0]['name']}');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: duSetWidth(10), right: duSetWidth(5)),
                        child: ClipOval(
                          child: Image.network(
                            _boardManager['data'][0]['avatarUrl'] +
                                '?w=80&h=80',
                            width: duSetWidth(24),
                            height: duSetHeight(24),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (_boardManager['data'].length > 0)
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.white,
                      size: duSetFontSize(15),
                    )
                ],
              )
            ],
          )
        : Container();
  }

  Widget _buildBoardList() {
    dynamic data;
    if (_boardDetail != null) {
      data = _tabIndex < 2
          ? _boardDetail['data']['topics']
          : _tabIndex == 2
              ? _boardDetail['data']['articles']
              : _boardDetail['data']['tops'];
    }
    return _boardDetail != null
        ? listWidget(data, onTapItem: (item) {
            Application.router
                .navigateTo(context, '/post_details/${item['id']}');
          })
        : cardListSkeleton();
  }

  Widget _buildStickTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: TabBar(
          labelColor: AppColors.red,
          unselectedLabelColor: AppColors.subGrey,
          indicatorColor: AppColors.red,
          labelStyle: TextStyle(fontSize: duSetFontSize(15)),
          controller: _tabController,
          onTap: (index) async {
            if (index == _tabIndex) {
              return;
            }
            _tabIndex = index;
            pageNum = 1;
            await _loadNewData();
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 10),
              curve: Curves.ease,
            );
          },
          tabs: <Widget>[
            Tab(
              text: "最新帖子",
            ),
            Tab(
              text: "最新回复",
            ),
            Tab(
              text: "精华",
            ),
            Tab(
              text: "置顶",
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        enableControlFinishRefresh: true,
        controller: _easyRefreshController,
        header: MaterialHeader(enableHapticFeedback: true),
        onRefresh: () async {
          pageNum = 1;
          isRefreshing = true;
          await _loadNewData();
          _easyRefreshController.finishRefresh();
          isRefreshing = false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            _buildAppbar(),
            _buildStickTabBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: _buildBoardList(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: this.child,
      color: AppColors.white,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
