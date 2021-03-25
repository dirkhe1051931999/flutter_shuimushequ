import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/page/hot/index.dart';
import 'package:shuimushequ/page/home/index.dart';
import 'package:shuimushequ/page/discuss/index.dart';
import 'package:shuimushequ/page/profile/index.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final List<String> _tabTitles = ["Home", "Top 10", "讨论区", "我"];
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    // home
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.fontBlue,
      ),
      label: 'Home',
      backgroundColor: AppColors.white,
    ),
    // hot
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.hot,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.hot,
        color: AppColors.bgBlue,
      ),
      label: 'Hot',
      backgroundColor: AppColors.white,
    ),
    // message
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.message,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.message,
        color: AppColors.bgBlue,
      ),
      label: 'Message',
      backgroundColor: AppColors.white,
    ),
    // profile
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.profile,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.profile,
        color: AppColors.fontBlue,
      ),
      label: 'Profile',
      backgroundColor: AppColors.white,
    ),
  ];
  PageController _pageController;
  Widget _buildAppbar() {
    return blueAppBar(
      context: context,
      title: Text(
        _tabTitles[_page],
        style: TextStyle(
          color: AppColors.white,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18),
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.account_circle),
        color: AppColors.white,
        iconSize: duSetFontSize(30),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: AppColors.white,
          iconSize: duSetFontSize(30),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[HomePage(), HotPage(), MessagePage(), ProfilePage()],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationbar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: _handleNavBarTap,
    );
  }

  void _handleNavBarTap(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController =
        new PageController(initialPage: this._page, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationbar(),
    );
  }
}