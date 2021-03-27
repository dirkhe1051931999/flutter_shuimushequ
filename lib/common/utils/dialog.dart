import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

showLoading() async {
  //open loading
  SmartDialog.showLoading();

  //delay off
  await Future.delayed(Duration(seconds: 2));
  SmartDialog.dismiss();
}
