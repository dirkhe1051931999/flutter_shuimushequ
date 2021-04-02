import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:group_button/group_button.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/type/search/articles.dart';
import 'package:shuimushequ/common/type/search/board.dart';
import 'package:shuimushequ/common/type/search/account.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/search/account_widget.dart';
import 'package:shuimushequ/page/search/article_widget.dart';
import 'package:shuimushequ/page/search/board.widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  int _searchType = 0;
  TypeSearchArticleResponse _searchArticleResult;
  TypeSearchAccountResponse _searchAccountResult;
  TypeSearchBoardResponse _searchBoardResult;
  FocusNode focusInputNode;

  @override
  void initState() {
    super.initState();
    focusInputNode = FocusNode();
  }

  _searchData(String value) async {
    SmartDialog.showLoading();
    if (_searchType == 0) {
      _searchArticleResult =
          await SearchAPI.searchArticleData(context: context, params: {
        'keyword': value,
        "count": 20,
        "start": 0,
        "original": true,
        "earliest": '',
        "status": 0
      });
    } else if (_searchType == 1) {
      _searchAccountResult =
          await SearchAPI.searchAccountData(context: context, params: {
        'keyword': value,
        "count": 20,
        "start": 0,
      });
    } else {
      _searchBoardResult =
          await SearchAPI.searchBoardData(context: context, params: {
        'keyword': value,
      });
    }
    SmartDialog.dismiss();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusInputNode.dispose();
    super.dispose();
  }

  Widget _buildAppbar() {
    return blueAppBar(
      context: context,
      title: Text(
        '搜索',
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
    );
  }

  Widget _buildSearchInput() {
    return inputTextEdit(
      controller: _searchController,
      hintText: '搜索文章、用户和版面',
      submit: (value) {
        _searchArticleResult = null;
        _searchAccountResult = null;
        _searchBoardResult = null;
        if (_searchController.value.text == '') {
          SmartDialog.showToast('搜索内容不能为空', time: Duration(seconds: 3));
          return;
        }
        if (mounted) {
          setState(() {});
        }
        _searchData(value);
      },
      focusNode: focusInputNode,
    );
  }

  Widget _buildSelectType() {
    return Padding(
      padding: EdgeInsets.only(top: duSetHeight(10), bottom: duSetHeight(10)),
      child: GroupButton(
        isRadio: true,
        buttonWidth: duSetWidth(100),
        spacing: duSetWidth(10),
        borderRadius: Radii.k6pxRadius,
        selectedColor: AppColors.bgBlue,
        onSelected: (index, isSelected) {
          _searchController.clear();
          // focusInputNode.requestFocus();
          _searchType = index;
          _searchArticleResult = null;
          _searchAccountResult = null;
          _searchBoardResult = null;
          if (mounted) {
            setState(() {});
          }
        },
        buttons: [
          "文章",
          "用户",
          "版面",
        ],
      ),
    );
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 140, //收起的高度
        maxHeight: 140, //展开的最大高度
        child: Container(
          color: AppColors.white,
          child: Column(
            children: <Widget>[
              _buildSearchInput(),
              _buildSelectType(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleResult() {
    return _searchArticleResult == null
        ? Container()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(15),
              vertical: duSetHeight(10),
            ),
            child: articleWidget(
              articles: _searchArticleResult,
              onTapArticle: (item) {
                print('点击文章');
              },
              onTapBoard: (item) {
                print('点击板块');
              },
            ),
          );
  }

  Widget _buildAccountResult() {
    return _searchAccountResult == null
        ? Container()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(15),
              vertical: duSetHeight(10),
            ),
            child: accountWidget(
              accounts: _searchAccountResult,
              onTapUser: (item) {
                print(item);
              },
              onTapFollow: (item) {
                print(item);
              },
              onTapUnFollow: (item) {
                print(item);
              },
            ),
          );
  }

  Widget _buildBoardResult() {
    return _searchBoardResult == null
        ? Container()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(15),
              vertical: duSetHeight(10),
            ),
            child: boardWidget(
              boards: _searchBoardResult,
              onTap: (item) {
                print(item);
              },
            ),
          );
  }

  Widget _buildSearchResult() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (_searchType == 0) {
            return _buildArticleResult();
          } else if (_searchType == 1) {
            return _buildAccountResult();
          } else {
            return _buildBoardResult();
          }
        },
        childCount: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: CustomScrollView(
        slivers: <Widget>[
          _buildStickyBar(),
          _buildSearchResult(),
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
