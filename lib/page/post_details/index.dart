import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/post_details.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/type/post_details/comment.dart';
import 'package:shuimushequ/common/type/post_details/likes.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/post_details/mask_input.dart';
import 'package:shuimushequ/page/post_details/only_see_widget.dart';
import 'package:shuimushequ/page/post_details/post_comment.dart';
import 'package:shuimushequ/page/post_details/post_content.dart';
import 'package:shuimushequ/page/post_details/post_like.dart';

class PostDetailPage extends StatefulWidget {
  final String id;
  const PostDetailPage({this.id = ''});
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  TypePostDetailsResponse _postDetails;
  TypePostDetailsLikesResponse _postDetailsLikes;
  TypePostDetailsCommentResponse _postDetailsComment;
  TypePostDetailsCommentResponse _onlySeeResponse;
  ScrollController _scrollController = ScrollController();
  bool _getMoreLikes = false;
  bool isNoMoreData = false;
  bool isMoreDataing = false;
  dynamic _board;
  int commentPageSize = 20;
  int commentMode = 1;
  int commentPageNum = 1;
  double likesPosition = 0.0;
  double commentPosition = 0.0;
  int commentLength = 0;
  GlobalKey positionLikeKey = GlobalKey();
  GlobalKey positionCommentModeKey = GlobalKey();
  AppState _appState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('post details init');
    // 对 scrollController 进行监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isNoMoreData &&
          !isMoreDataing) {
        commentPageNum++;
        _loadMoreData();
      }
    });
    this._getData();
  }

  @override
  void dispose() {
    // 记得销毁对象
    _scrollController.dispose();
    super.dispose();
  }

  _getData() async {
    _postDetails = await PostDetailsAPI.getPostDetails(
      context: context,
      params: {'id': widget.id},
    );
    _postDetailsLikes = await PostDetailsAPI.getPostDetailsLikes(
      context: context,
      params: {'id': widget.id},
    );
    _postDetailsComment = await PostDetailsAPI.getPostDetailsComment(
      context: context,
      params: {
        'id': widget.id,
        "size": commentPageSize,
        "num": commentPageNum,
        "mode": commentMode,
      },
    );
    List articles = _postDetailsComment.data.toJson()['articles'];
    if (articles.length < commentPageSize) {
      isNoMoreData = true;
    }
    _board = _postDetails.data.toJson()['topic']['board'];
    if (mounted) {
      setState(() {});
    }
  }

  _loadingNewData() async {
    _postDetailsComment = await PostDetailsAPI.getPostDetailsComment(
      context: context,
      params: {
        'id': widget.id,
        "size": commentPageSize,
        "num": commentPageNum,
        "mode": commentMode,
      },
    );
    List articles = _postDetailsComment.data.toJson()['articles'];
    if (articles.length < commentPageSize) {
      isNoMoreData = true;
    }
  }

  _loadMoreData() async {
    SmartDialog.showLoading();
    isMoreDataing = true;
    TypePostDetailsCommentResponse more;
    more = await PostDetailsAPI.getPostDetailsComment(
      context: context,
      params: {
        'id': widget.id,
        "size": commentPageSize,
        "num": commentPageNum,
        "mode": commentMode,
      },
    );
    _postDetailsComment.data.articles.addAll(more.data.articles);
    List articles = _postDetailsComment.data.toJson()['articles'];
    if (articles.length < commentPageSize) {
      isNoMoreData = true;
      SmartDialog.showToast('我也是有底线的~');
    }
    isMoreDataing = false;
    SmartDialog.dismiss();
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildAppBar(dynamic board) {
    return blueAppBar(
      context: context,
      centerTitle: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            board == null ? '--' : board['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(14),
              fontWeight: FontWeight.w600,
            ),
          ),
          board == null
              ? Text('')
              : Icon(
                  Icons.arrow_forward_ios,
                  size: duSetFontSize(12),
                  color: AppColors.bgGrey,
                ),
        ],
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
          onPressed: () {
            print(board);
          },
        )
      ],
    );
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: duSetHeight(70),
        maxHeight: duSetHeight(70),
        child: Container(
          color: AppColors.white,
          alignment: Alignment.centerLeft,
          child: Text('123'),
        ),
      ),
    );
  }

  Widget _buildList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(
                bottom: duSetHeight(50),
              ),
              child: _postDetails == null
                  ? postContentLoading()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        postContentWidget(
                          _postDetails,
                          onTapImage: (images, index) {
                            _appState.setImageViewCurrentIndex(index);
                            _appState.setImageViewAllData(images);
                            Application.router
                                .navigateTo(context, '/imageView');
                          },
                          onTapUser: (id, name) {
                            print(name);
                            Application.router
                                .navigateTo(context, '/account/$id/$name');
                          },
                        ),
                        Container(
                          height: duSetHeight(10),
                        ),
                        Container(
                          height: duSetHeight(10),
                          color: AppColors.bgGrey,
                        ),
                        _postDetailsLikes == null
                            ? Container()
                            : Container(
                                key: positionLikeKey,
                                child: postLikeWidget(
                                  _postDetailsLikes,
                                  _getMoreLikes,
                                  onTapLike: (item) {},
                                  onTapMore: (item) async {
                                    if (_getMoreLikes == false) {
                                      RenderBox renderBox = positionLikeKey
                                          .currentContext
                                          .findRenderObject();
                                      dynamic offset =
                                          renderBox.localToGlobal(Offset.zero);
                                      likesPosition = offset.dy;
                                    } else {
                                      await _scrollController.animateTo(
                                        likesPosition,
                                        duration: Duration(milliseconds: 10),
                                        curve: Curves.ease,
                                      );
                                      likesPosition = 0;
                                    }
                                    _getMoreLikes = !_getMoreLikes;
                                    setState(() {});
                                  },
                                ),
                              ),
                        Container(
                          height: duSetHeight(10),
                          color: AppColors.bgGrey,
                        ),
                        _postDetailsComment == null
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    key: positionCommentModeKey,
                                    child: _buildCommentModeBar(_postDetails),
                                  ),
                                  postCommentWidget(
                                    _postDetailsComment,
                                    onTapMore: (item) {},
                                    onTapReply: (item) {},
                                    onTapOnlySee: (item) async {
                                      SmartDialog.showLoading();
                                      _onlySeeResponse = await PostDetailsAPI
                                          .getOnlySeeComment(
                                        context: context,
                                        params: {
                                          "topicId": item['topicId'],
                                          "articleId": item['id'],
                                        },
                                      );

                                      if (_onlySeeResponse
                                              .data.articles.length ==
                                          1) {
                                        SmartDialog.showToast('只有这一条哦~');
                                        SmartDialog.dismiss();
                                        return;
                                      }
                                      await SmartDialog.show(
                                        alignmentTemp: Alignment.bottomCenter,
                                        clickBgDismissTemp: true,
                                        widget: Container(
                                          height: duSetHeight(550),
                                          width: duSetWidth(350),
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: onlySeeWidget(
                                            _onlySeeResponse,
                                            onTapMore: (item) {},
                                            onTapReply: (item) {},
                                            onTapUser: (id, name) {
                                              Application.router.navigateTo(
                                                  context,
                                                  '/account/$id/$name');
                                            },
                                          ),
                                        ),
                                      );
                                      SmartDialog.dismiss();
                                    },
                                    onTapUser: (id, name) {
                                      Application.router.navigateTo(
                                          context, '/account/$id/$name');
                                    },
                                  )
                                ],
                              ),
                      ],
                    ),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  Widget _buildBottomSheet() {
    return _postDetailsComment == null
        ? Container()
        : GestureDetector(
            child: Container(
              height: duSetHeight(48),
              padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.borderGrey,
                    width: duSetWidth(1),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      '评论共 ${_postDetailsComment.data.toJson()['pager']['totalPages']} 页',
                      style: TextStyle(
                        color: AppColors.subGrey,
                        fontFamily: 'Montserrat',
                        fontSize: duSetFontSize(12),
                      ),
                    ),
                    width: duSetWidth(110),
                  ),
                  Container(
                    width: duSetWidth(130),
                    height: duSetHeight(28),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
                    decoration: BoxDecoration(
                      color: AppColors.bgGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      '发表你的观点',
                      style: TextStyle(
                        color: AppColors.subGrey,
                        fontFamily: 'Montserrat',
                        fontSize: duSetFontSize(12),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.star_border_rounded,
                        size: duSetFontSize(30),
                        color: AppColors.subGrey,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: duSetWidth(10)),
                        child: Icon(Icons.favorite_border,
                            size: duSetFontSize(25), color: AppColors.subGrey),
                      ),
                      Icon(
                        Icons.ios_share,
                        size: duSetFontSize(25),
                        color: AppColors.subGrey,
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return maskPage();
                  },
                  transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation1,
                    Animation<double> animation2,
                    Widget child,
                  ) {
                    ///  渐变过渡
                    return FadeTransition(
                      ///渐变过渡 0.0-1.0
                      opacity: Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation1,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                ),
              );
            },
          );
  }

  Widget _buildCommentModeBar(TypePostDetailsResponse details) {
    int availables = details.data.toJson()['topic']['availables'];
    commentLength = availables - 1;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
      child: Row(
        children: <Widget>[
          Text(
            '全部回复 ',
            style: TextStyle(
              color: AppColors.fontBlack,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(12),
              height: 1.3,
            ),
          ),
          Container(
            height: duSetHeight(46),
            alignment: Alignment.centerLeft,
            child: Text(
              commentLength.toString(),
              style: TextStyle(
                color: AppColors.subGrey,
                fontFamily: 'Montserrat',
                fontSize: duSetFontSize(12),
                height: 1.3,
              ),
            ),
          ),
          Text(
            ' 条',
            style: TextStyle(
              color: AppColors.fontBlack,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(12),
              height: 1.3,
            ),
          ),
          Spacer(),
          Flexible(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: duSetHeight(2), horizontal: duSetWidth(2)),
              width: duSetWidth(180),
              decoration: BoxDecoration(
                color: HexColor('#f5f5f5'),
                borderRadius: Radii.k10pxRadius,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      commentMode = 0;
                      _resetQueryData();
                      SmartDialog.showLoading();
                      await this._loadingNewData();
                      SmartDialog.dismiss();
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: duSetWidth(6)),
                      decoration: BoxDecoration(
                        color: commentMode == 0
                            ? AppColors.white
                            : HexColor('#f5f5f5'),
                        borderRadius: Radii.k10pxRadius,
                      ),
                      child: Text(
                        '看楼主',
                        style: TextStyle(
                          color: AppColors.fontBlack,
                          fontFamily: 'Montserrat',
                          fontSize: duSetFontSize(12),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      commentMode = 1;
                      _resetQueryData();
                      SmartDialog.showLoading();
                      await this._loadingNewData();
                      SmartDialog.dismiss();
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: duSetWidth(3)),
                      padding: EdgeInsets.symmetric(horizontal: duSetWidth(6)),
                      decoration: BoxDecoration(
                        color: commentMode == 1
                            ? AppColors.white
                            : HexColor('#f5f5f5'),
                        borderRadius: Radii.k10pxRadius,
                      ),
                      child: Text(
                        '从头看',
                        style: TextStyle(
                          color: AppColors.fontBlack,
                          fontFamily: 'Montserrat',
                          fontSize: duSetFontSize(12),
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      commentMode = 2;
                      _resetQueryData();
                      SmartDialog.showLoading();
                      await this._loadingNewData();
                      SmartDialog.dismiss();
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: duSetWidth(6)),
                      decoration: BoxDecoration(
                        color: commentMode == 2
                            ? AppColors.white
                            : HexColor('#f5f5f5'),
                        borderRadius: Radii.k10pxRadius,
                      ),
                      child: Text(
                        '看最新',
                        style: TextStyle(
                          color: AppColors.fontBlack,
                          fontFamily: 'Montserrat',
                          fontSize: duSetFontSize(12),
                          height: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _resetQueryData() {
    commentPageNum = 1;
    isNoMoreData = false;
    isMoreDataing = false;
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: _buildAppBar(_board),
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          // _buildStickyBar(),
          _buildList(),
        ],
      ),
      bottomSheet: _buildBottomSheet(),
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
