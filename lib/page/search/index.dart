import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:group_button/group_button.dart';
import 'package:html/parser.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/type/search/articles.dart';
import 'package:shuimushequ/common/type/search/board.dart';
import 'package:shuimushequ/common/type/search/account.dart';
import 'package:shuimushequ/common/utils/authentication.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/global.dart';
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
        '??????',
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
      hintText: '??????????????????????????????',
      submit: (value) {
        _searchArticleResult = null;
        _searchAccountResult = null;
        _searchBoardResult = null;
        if (_searchController.value.text == '') {
          SmartDialog.showToast('????????????????????????', time: Duration(seconds: 3));
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
          "??????",
          "??????",
          "??????",
        ],
      ),
    );
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //?????????????????????
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 140, //???????????????
        maxHeight: 140, //?????????????????????
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
                Application.router.navigateTo(
                    context, '/post_details/${item['topic']['id']}');
              },
              onTapBoard: (item) {
                Application.router.navigateTo(context,
                    '/board/${item['board']['id']}/${item['board']['title']}');
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
                String name = parse(item['name']).body.text;
                String id = item['id'];
                String regexString = r'(^[0-9a-zA-Z_]{1,}$)';
                RegExp regExp = new RegExp(regexString);
                if (regExp.hasMatch(name) == false) {
                  SmartDialog.showToast('????????????????????????');
                  return;
                }
                Application.router.navigateTo(context, '/account/$id/$name');
              },
              onTapFollow: (item) {
                print(item);
                if (Global.isOfflineLogin == false) {
                  goLoginPage(context);
                }
              },
              onTapUnFollow: (item) {
                print(item);
                if (Global.isOfflineLogin == false) {
                  goLoginPage(context);
                }
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
                Application.router.navigateTo(
                    context, '/board/${item['id']}/${item['title']}');
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
