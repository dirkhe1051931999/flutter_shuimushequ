import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/type/home/categories.dart';
import 'package:shuimushequ/common/type/user/my.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/global.dart';
import 'package:shuimushequ/page/home/album_post_widget.dart';
import 'package:shuimushequ/page/home/categories_widget.dart';
import 'package:shuimushequ/page/home/post_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 返回true
  String _categoriesType = 'global';
  String _categoriesId = '4ed7f0d8b621c8ccf9e11eca9991d6dc';
  int pageSize = 20;
  int pageNum = 1;
  AppState _appState;
  TypeCategoriesResponse _categories;
  dynamic _albumPostList;
  dynamic _postList;
  EasyRefreshController _controller;
  ScrollController _customScrollViewController = ScrollController();
  bool isRefreshing = false;
  bool isNoMoreData = false;
  bool isMoreDataing = false;
  @override
  void initState() {
    super.initState();
    print('home init');
    _controller = EasyRefreshController();
    _customScrollViewController.addListener(() {
      if (_customScrollViewController.position.pixels ==
              _customScrollViewController.position.maxScrollExtent &&
          !isRefreshing &&
          !isNoMoreData &&
          !isMoreDataing) {
        pageNum++;
        _loadMoreData();
      }
    });
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_HOME_POST_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadAllData() async {
    _categories = await CommunityAPI.getCategories(context: context);
    if (_categoriesType == 'album') {
      _albumPostList = await CommunityAPI.getAlbumPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
    } else {
      _postList = await CommunityAPI.getPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
    }
    if (Global.isOfflineLogin) {
      TypeMyResponse res = await UserAPI.mySettings(context: context);
      print(res.toJson());
    }
    if (mounted) {
      setState(() {});
    }
  }

  _loadNewData() async {
    if (_categoriesType == 'album') {
      _albumPostList = await CommunityAPI.getAlbumPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
    } else {
      _postList = await CommunityAPI.getPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
    }
    if (mounted) {
      setState(() {});
    }
  }

  _loadMoreData() async {
    SmartDialog.showLoading();
    isMoreDataing = true;
    if (_categoriesType == 'album') {
      dynamic more;
      more = await CommunityAPI.getAlbumPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
      _albumPostList['data']['articles'].addAll(more['data']['articles']);
      List articles = more.data.toJson()['articles'];
      if (articles.length == 0) {
        isNoMoreData = true;
        SmartDialog.showToast('我也是有底线的~');
      }
      SmartDialog.dismiss();
      isMoreDataing = false;
    } else {
      dynamic more;
      more = await CommunityAPI.getPostList(
        tabName: _categoriesType,
        tabId: _categoriesId,
        context: context,
        params: {"page": pageNum, "size": pageSize},
      );
      _postList['data']['topics'].addAll(more['data']['topics']);
      List topics = more.data.toJson()['topics'];
      if (topics.length == 0) {
        isNoMoreData = true;
        SmartDialog.showToast('我也是有底线的~');
      }
      SmartDialog.dismiss();
      isMoreDataing = false;
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : categoriesWidget(
            categories: _categories,
            categoriesType: _categoriesType,
            categoriesId: _categoriesId,
            onTap: (item) async {
              _categoriesType = item['type'];
              _categoriesId = item['id'];
              pageNum = 1;
              isNoMoreData = false;
              isMoreDataing = false;
              _customScrollViewController
                  .jumpTo(_customScrollViewController.position.minScrollExtent);
              SmartDialog.showLoading();
              await _loadNewData();
              SmartDialog.dismiss();
            },
          );
  }

  Widget _buildPosts() {
    if (_categoriesType == 'album') {
      return _albumPostList == null
          ? Container()
          : albumPostWidget(
              posts: _albumPostList,
              onTapImage: (index, images) {
                _appState.setImageViewCurrentIndex(index);
                _appState.setImageViewAllData(images);
                Application.router.navigateTo(context, '/imageView');
              },
              onTapPost: (item) {
                Application.router
                    .navigateTo(context, '/post_details/${item['topicId']}');
              },
            );
    } else {
      return _postList == null
          ? Container()
          : postWidget(
              posts: _postList,
              isPictureMode: _appState.isPictureMode,
              categoriesType: _categoriesType,
              categoriesId: _categoriesId,
              onTap: (item) {
                Application.router
                    .navigateTo(context, '/post_details/${item['id']}');
              },
              onTapImage: (index, images) {
                _appState.setImageViewCurrentIndex(index);
                _appState.setImageViewAllData(images);
                Application.router.navigateTo(context, '/imageView');
              },
            );
    }
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 50, //收起的高度
          maxHeight: 50, //展开的最大高度
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            color: AppColors.white,
            alignment: Alignment.centerLeft,
            child: _buildCategories(),
          )),
    );
  }

  Widget _buildList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        return _buildPosts();
      },
      childCount: 1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);

    return _categories == null || _postList == null
        ? cardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(
              infoColor: AppColors.fontBlack,
              infoText: 'Update at ${duTimeLineFormat2(DateTime.now())}',
            ),
            onRefresh: () async {
              pageNum = 1;
              isRefreshing = true;
              await _loadNewData();
              _controller.finishRefresh();
              isRefreshing = false;
            },
            child: CustomScrollView(
              controller: _customScrollViewController,
              slivers: <Widget>[
                _buildStickyBar(),
                _buildList(),
              ],
            ),
          );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
