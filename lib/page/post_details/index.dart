import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuimushequ/common/api/post_details.dart';
import 'package:shuimushequ/common/type/post_details/post.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';
import 'package:shuimushequ/page/post_details/mask_input.dart';

class PostDetailPage extends StatefulWidget {
  final String id;
  const PostDetailPage({this.id = ''});
  // PostDetailPage({Key key}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  TypePostDetailsResponse _postDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }

  _getData() async {
    _postDetails = await PostDetailsAPI.getPostDetails(
      context: context,
      params: {'id': widget.id},
    );
    print(_postDetails.toJson());
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
        alignment: Alignment.centerLeft,
        height: 20,
        child: Row(children: [Text('头')]),
      ),
    );
  }

  Widget _buildStickyBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: duSetHeight(50), //收起的高度
        maxHeight: duSetHeight(50), //展开的最大高度
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
          alignment: Alignment.centerLeft,
          child: Text("吸顶", style: TextStyle(fontSize: 18)),
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
                left: duSetWidth(15),
                right: duSetWidth(15),
              ),
              child: Text('内容$index'),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("标题")),
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildStickyBar(),
          _buildBanner(),
          _buildList(),
        ],
      ),
      bottomSheet: GestureDetector(
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
                  '评论：第1页/共1页',
                  style: TextStyle(
                    color: AppColors.fontBlack,
                    fontFamily: 'Montserrat',
                    fontSize: duSetFontSize(14),
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
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.star_border_rounded,
                    size: duSetFontSize(30),
                    color: AppColors.fontBlack,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: duSetWidth(10)),
                    child: Icon(
                      Icons.favorite_border,
                      size: duSetFontSize(25),
                      color: AppColors.fontBlack,
                    ),
                  ),
                  Icon(
                    Icons.ios_share,
                    size: duSetFontSize(25),
                    color: AppColors.fontBlack,
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
                      ///动画样式
                      parent: animation1,

                      ///动画曲线
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: child,
                );
              },
            ),
          );
        },
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
