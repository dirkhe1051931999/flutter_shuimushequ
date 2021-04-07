import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shuimushequ/common/api/board.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/board/search_article_widget.dart';

class BoardSearchPage extends StatefulWidget {
  final id;
  final name;
  BoardSearchPage({Key key, this.id, this.name}) : super(key: key);

  @override
  _BoardSearchPageState createState() => _BoardSearchPageState();
}

class _BoardSearchPageState extends State<BoardSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  dynamic _searchArticleResult;
  FocusNode focusInputNode;

  @override
  void initState() {
    super.initState();
    focusInputNode = FocusNode();
  }

  _searchData(String value) async {
    SmartDialog.showLoading();
    _searchArticleResult =
        await BoardAPI.searchArticleData(context: context, params: {
      'keyword': value,
      "count": 20,
      "start": 0,
      "original": true,
      "earliest": '',
      "status": 0,
      "boards": widget.name
    });
    print(_searchArticleResult);
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
        '搜${widget.id}',
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
      hintText: '搜索',
      submit: (value) {
        _searchArticleResult = null;
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

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 85, //收起的高度
        maxHeight: 85, //展开的最大高度
        child: Container(
          color: AppColors.white,
          child: Column(
            children: <Widget>[
              _buildSearchInput(),
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
            child: searchArticleWidget(
              _searchArticleResult,
              onTapArticle: (item) {
                Application.router.navigateTo(
                    context, '/post_details/${item['topic']['id']}');
              },
            ),
          );
  }

  Widget _buildSearchResult() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildArticleResult();
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
