import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';

class CommentInputPage extends StatefulWidget {
  CommentInputPage({Key key}) : super(key: key);

  @override
  _CommentInputPageState createState() => _CommentInputPageState();
}

class _CommentInputPageState extends State<CommentInputPage> {
  FocusNode focusInputNode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusInputNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController;
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: duSetWidth(16),
              vertical: duSetWidth(5),
            ),
            color: AppColors.bgGrey,
            child: Row(
              children: [Text('发布评论')],
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
                  hintText: '请输入评论的内容',
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
                Icon(
                  Icons.image,
                  size: duSetFontSize(30),
                  color: AppColors.fontBlack,
                ),
                Icon(
                  Icons.sentiment_satisfied,
                  size: duSetFontSize(30),
                  color: AppColors.fontBlack,
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
