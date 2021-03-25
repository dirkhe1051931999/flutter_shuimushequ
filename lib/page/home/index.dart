import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/type/home/categories.dart';
import 'package:shuimushequ/common/type/home/post.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
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
  TypePostResponse _postList;
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    print('home init');
    _controller = EasyRefreshController();
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
    _postList = await CommunityAPI.getPostList(
      tabName: _categoriesType,
      tabId: _categoriesId,
      context: context,
      params: {"page": pageNum, "size": pageSize},
    );
    if (mounted) {
      setState(() {});
    }
  }

  _loadNewData() async {
    _postList = await CommunityAPI.getPostList(
      tabName: _categoriesType,
      tabId: _categoriesId,
      context: context,
      params: {"page": pageNum, "size": pageSize},
    );
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
            onTap: (item) {
              _categoriesType = item['type'];
              _categoriesId = item['id'];
              _loadNewData();
            },
          );
  }

  Widget _buildPosts() {
    return _postList == null
        ? Container()
        : postWidget(
            posts: _postList,
            categoriesType: _categoriesType,
            categoriesId: _categoriesId,
            onTap: (item) {
              print(item);
            },
          );
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
            // onRefresh: () async {
            //   return true;
            // },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCategories(),
                  _buildPosts(),
                ],
              ),
            ),
          );
  }
}