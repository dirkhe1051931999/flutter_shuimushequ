import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/common/type/hot/ten.dart';
import 'package:shuimushequ/common/type/hot/board.dart';
import 'package:shuimushequ/page/hot/board_widget.dart';
import 'package:shuimushequ/page/hot/ten_widget.dart';

class HotPage extends StatefulWidget {
  HotPage({Key key}) : super(key: key);

  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 返回true
  TypeHotBoardResponse _boardList;
  TypeHotTenResponse _tenPostList;
  int pageSize = 20;
  int pageNum = 1;
  AppState _appState;
  EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    print('hot init');
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_HOT_POST_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  _loadAllData() async {
    _tenPostList = await HotAPI.getHotTenList(
        context: context, params: {"page": pageNum, "size": pageSize});
    _boardList = await HotAPI.getHotBoardList(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildHotTen() {
    return _tenPostList == null
        ? Container()
        : hotTenWidget(
            posts: _tenPostList,
            onTap: (item) {
              print(item);
            },
          );
  }

  Widget _buildBoard() {
    return _boardList == null
        ? Container()
        : Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: duSetHeight(10)),
                color: AppColors.bgGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          right: duSetWidth(5), left: duSetWidth(15)),
                      width: duSetWidth(4),
                      height: duSetHeight(13),
                      color: AppColors.bgBlue,
                    ),
                    Text(
                      '人气版面推荐',
                      style: TextStyle(
                        fontSize: duSetFontSize(14),
                        color: AppColors.fontBlack,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
                decoration: BoxDecoration(color: AppColors.bgGrey),
                child: HotBoardWidget(
                  boards: _boardList,
                  onTap: (item) {
                    print(item);
                  },
                ),
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);

    return _tenPostList == null || _boardList == null
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
                  _buildHotTen(),
                  _buildBoard(),
                ],
              ),
            ),
          );
  }
}
