import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/account/timeline_widget.dart';
import 'package:shuimushequ/page/account/userinfo_widget.dart';

class AccountPage extends StatefulWidget {
  final String id;
  final String name;
  AccountPage({Key key, this.id, this.name}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  dynamic _userCommentLogs;
  dynamic _account;
  List<dynamic> _content;
  int pageNum = 1;
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    _userCommentLogs = await UserAPI.getUserTimeLineData(
      context: context,
      params: {"name": widget.name, "page": pageNum},
    );
    print(_userCommentLogs);
    _account = _userCommentLogs['data']['account'];
    _content = _userCommentLogs['data']['content'];
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    super.dispose();
    _scrollController.dispose();
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: true,
      centerTitle: true,
      title: Text(
        '用户信息',
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
          icon: Icon(Icons.more_horiz),
          color: AppColors.white,
          iconSize: duSetFontSize(30),
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
                    child: Image.asset(
                      "assets/images/feature-1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 200,
                  child: _buildUserInfo(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return _account == null ? Container() : userInfoWidget(account: _account);
  }

  Widget _buildUserTimeline() {
    return _content == null ? Container() : timeLineWidget(content: _content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppbar(),
          SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => ListTile(title: Text('Item #$index')),
            // Builds 1000 ListTiles
            childCount: 20,
          )),
          SliverToBoxAdapter(
            child: _buildUserTimeline(),
          )
          // Sliver
        ],
      ),
    );
  }
}
