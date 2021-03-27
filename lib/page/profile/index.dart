import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/provider/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/authentication.dart';
import 'package:shuimushequ/page/profile/box_widget.dart';
import 'package:shuimushequ/page/profile/link_widget.dart';
import 'package:shuimushequ/page/profile/user_widget.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppState _appState;
  Widget _buildUserWidget() {
    return UserWidget((item) => {}, (item) => {});
  }

  Widget _buildBoxWidget({bool isSunDay, bool isPictureMode}) {
    return BoxWidget(
      (item) {
        print(item);
        if (item['route'] == null) {
          if (item['isPictureMode'] != null) {
            _appState.switchPictureMode();
          }
          if (item['isSunDay'] != null) {
            _appState.switchSunDay();
          }
        }
      },
      isSunDay: _appState.isSunDay,
      isPictureMode: _appState.isPictureMode,
    );
  }

  Widget _buildLinkWidget() {
    return LinkWidget((item) async {
      if (item['route'] == null) {
        if (await confirm(
          context,
          title: Text('退出登录'),
          content: Text('确定退出吗？'),
          textOK: Text('确定'),
          textCancel: Text('取消'),
        )) {
          await UserAPI.logout(
            context: context,
            params: {"t": DateTime.now().microsecondsSinceEpoch},
          );
          deleteAuthentication();
          Application.router.navigateTo(context, '/login');
          return;
        }
        return print('pressedCancel');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _appState = Provider.of<AppState>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          _buildUserWidget(),
          Divider(),
          _buildBoxWidget(
            isSunDay: _appState.isSunDay,
            isPictureMode: _appState.isPictureMode,
          ),
          _buildLinkWidget(),
        ],
      ),
    );
  }
}
