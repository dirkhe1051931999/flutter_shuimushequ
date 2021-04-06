import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class LikeInputPage extends StatefulWidget {
  LikeInputPage({Key key}) : super(key: key);

  @override
  _LikeInputPageState createState() => _LikeInputPageState();
}

class _LikeInputPageState extends State<LikeInputPage> {
  TextEditingController _textController;
  double _value = 0.0;
  Map face = {
    "-5.0": Image.asset(
      "assets/images/-5.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "-4.0": Image.asset(
      "assets/images/-4.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "-3.0": Image.asset(
      "assets/images/-3.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "-2.0": Image.asset(
      "assets/images/-2.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "-1.0": Image.asset(
      "assets/images/-1.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "0.0": Image.asset(
      "assets/images/0.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "1.0": Image.asset(
      "assets/images/+1.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "2.0": Image.asset(
      "assets/images/+2.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "3.0": Image.asset(
      "assets/images/+3.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "4.0": Image.asset(
      "assets/images/+4.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
    "5.0": Image.asset(
      "assets/images/+5.png",
      width: duSetWidth(40),
      height: duSetHeight(40),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x90000000),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 关闭输入框
                Navigator.pop(context);
              },
            ),
          ),
          Container(child: face[_value.toString()]),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(16),
              vertical: duSetWidth(5),
            ),
            color: AppColors.bgGrey,
            child: SfSlider(
              activeColor: AppColors.bgBlue,
              min: -5.0,
              max: 5.0,
              stepSize: 1,
              interval: 1,
              value: _value,
              showTicks: false,
              showLabels: true,
              enableTooltip: false,
              onChanged: (dynamic value) {
                if (mounted) {
                  setState(() {
                    _value = value;
                  });
                }
              },
            ),
          ),
          Container(
            color: AppColors.bgGrey,
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(16),
              vertical: duSetHeight(8),
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                controller: _textController,
                autofocus: true,
                style: TextStyle(fontSize: duSetFontSize(14)),
                //设置键盘按钮为发送
                textInputAction: TextInputAction.send,
                keyboardType: TextInputType.multiline,
                onEditingComplete: () {},
                decoration: InputDecoration(
                  hintText: 'Like 是一种态度',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: duSetWidth(10),
                    vertical: duSetHeight(5),
                  ),
                  border: const OutlineInputBorder(
                    gapPadding: 0,
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
                minLines: 2,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            color: AppColors.bgGrey,
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(16),
            ),
            child: Row(
              children: [
                Text(
                  '每次 Like 花费15积分',
                  style: TextStyle(
                    color: AppColors.subGrey,
                    fontFamily: "Montserrat",
                    fontSize: duSetFontSize(12),
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: SizedBox()),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.bgBlue,
                    ),
                    onPressed: () {},
                    child: Text(
                      '确认',
                      style: TextStyle(fontSize: duSetFontSize(12)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
