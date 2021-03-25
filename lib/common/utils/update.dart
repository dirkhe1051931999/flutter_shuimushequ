import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/widgets/index.dart';
import 'package:shuimushequ/global.dart';

/// app 升级
class AppUpdateUtil {
  static AppUpdateUtil _instance = AppUpdateUtil._internal();
  factory AppUpdateUtil() => _instance;

  BuildContext _context;
  dynamic _appUpdateInfo;

  AppUpdateUtil._internal();

  /// 获取更新信息
  Future run(BuildContext context) async {
    _context = context;

    // 提交 设备类型、发行渠道、架构、机型
    Map<String, dynamic> requestDeviceInfo = {
      "device": Global.isIOS == true ? "ios" : "android",
      "channel": Global.channel,
      "architecture": Global.isIOS == true
          ? Global.iosDeviceInfo.utsname.machine
          : Global.androidDeviceInfo.device,
      "model": Global.isIOS == true
          ? Global.iosDeviceInfo.name
          : Global.androidDeviceInfo.brand,
    };
    print('update package');
    print(requestDeviceInfo);
    _appUpdateInfo = {
      "shopUrl": "",
      "fileUrl": "",
      "latestVersion": "1.0.3",
      "latestDescription": "升级测试"
    };
    _runAppUpdate();
  }

  /// 检查是否有新版
  Future _runAppUpdate() async {
    // 比较版本
    final isNewVersion =
        (_appUpdateInfo['latestVersion'] != (Global.packageInfo.version));

    // 安装
    if (isNewVersion == true) {
      _appUpdateConformDialog(() {
        Navigator.of(_context).pop();
        if (Global.isIOS == true) {
          // 去苹果店
          InstallPlugin.gotoAppStore(_appUpdateInfo['shopUrl']);
        } else {
          // apk 下载安装
          toastInfo(msg: "开始下载升级包");
          _downloadAPKAndSetup(_appUpdateInfo['fileUrl']);
        }
      });
    }
  }

  /// 下载文件 & 安装
  Future _downloadAPKAndSetup(String fileUrl) async {
    // 下载
    Directory externalDir = await getExternalStorageDirectory();
    String fullPath = externalDir.path + "/release.apk";

    Dio dio = Dio(
      BaseOptions(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ),
    );
    Response response = await dio.get(
      fileUrl,
    );

    File file = File(fullPath);
    var raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    // 安装
    await InstallPlugin.installApk(fullPath, Global.packageInfo.packageName);
  }

  /// 升级确认对话框
  void _appUpdateConformDialog(VoidCallback onPressed) {
    EasyDialog(
      title: Text(
        "发现新版本 ${_appUpdateInfo['latestVersion']}",
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.2,
      ),
      description: Text(
        _appUpdateInfo['latestDescription'],
        textScaleFactor: 1.1,
        textAlign: TextAlign.center,
      ),
      height: 220,
      contentList: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new TextButton(
              onPressed: onPressed,
              child: new Text(
                "OK",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
            new TextButton(
              onPressed: () {
                Navigator.of(_context).pop();
              },
              child: new Text(
                "Cancel",
                textScaleFactor: 1.2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ],
        ),
      ],
    ).show(_context);
  }
}
