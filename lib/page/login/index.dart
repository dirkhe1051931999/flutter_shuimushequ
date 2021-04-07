import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shuimushequ/common/api/index.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/global.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //email的控制器
  final TextEditingController _usernameController = TextEditingController();
  //密码的控制器
  final TextEditingController _passController = TextEditingController();
  FocusNode focusInputUsernameNode;
  FocusNode focusInputPasswordNode;

  @override
  void initState() {
    super.initState();
    focusInputUsernameNode = FocusNode();
    focusInputPasswordNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusInputUsernameNode.dispose();
    focusInputPasswordNode.dispose();
    super.dispose();
  }

  Widget _buildAppbar() {
    return blueAppBar(
      context: context,
      title: Text(
        '登录',
        style: TextStyle(
          color: AppColors.white,
          fontFamily: 'Montserrat',
          fontSize: duSetFontSize(18),
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        color: AppColors.white,
        iconSize: duSetFontSize(30),
        onPressed: () {
          if (Global.isOfflineLogin == false) {
            SmartDialog.showToast('您还没有登录');
            Application.router.navigateTo(context, '/');
          } else {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  // 执行登录操作
  _handleSignIn() async {
    if (_usernameController.value.text == '') {
      SmartDialog.showToast('用户名不能为空');
      return;
    }
    if (_passController.value.text == '') {
      SmartDialog.showToast('密码不能为空');
      return;
    }

    Map<String, dynamic> data = {
      "username": _usernameController.value.text,
      "password": _passController.value.text,
      "t": DateTime.now().millisecondsSinceEpoch,
    };
    SmartDialog.showLoading();
    dynamic _res = await UserAPI.login(context: context, params: data);
    SmartDialog.dismiss();
    var responseHeaders = _res['headers'];
    var responseData = _res['data'];
    if (responseData['data'] == null) {
      focusInputUsernameNode.unfocus();
      focusInputPasswordNode.unfocus();
      SmartDialog.showToast(responseData['message']);
    } else {
      dynamic account = responseData['data']['account'];
      List key = responseHeaders['set-cookie'][0].split(';');
      var info = responseHeaders['set-cookie'][1].split(';');
      var keyVal = key[0].split('=')[1];
      var infoVal = info[0].split('=')[1];
      Global.saveProfile({
        "sign-time": DateTime.now().millisecondsSinceEpoch,
        "set_identity": jsonEncode(account),
        "kbs-info": infoVal,
        "kbs-key": keyVal,
      });
      focusInputUsernameNode.unfocus();
      focusInputPasswordNode.unfocus();
      SmartDialog.showToast('登录成功');
      Application.router.navigateTo(context, '/');
    }
  }

  ///////////////////////////////

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(duSetWidth(76 * 0.5))), // 父容器的50%
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: duSetWidth(90),
                    height: duSetWidth(90),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "水木社区",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.fontBlack,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      // height: 204,
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // 用户名
          inputTextEdit(
            controller: _usernameController,
            keyboardType: TextInputType.text,
            hintText: "用户名",
            marginTop: 0,
            focusNode: focusInputUsernameNode,
          ),
          // password input
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "密码",
            isPassword: true,
            focusNode: focusInputPasswordNode,
          ),
          // 登录按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: btnFlatButtonWidget(
              width: duSetWidth(375),
              onPressed: () => _handleSignIn(),
              gbColor: AppColors.bgBlue,
              fontColor: AppColors.white,
              title: "Sign in",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: duSetWidth(40), right: duSetWidth(40)),
          child: Column(
            children: <Widget>[
              _buildLogo(),
              _buildInputForm(),
            ],
          ),
        ),
      ),
    );
  }
}
