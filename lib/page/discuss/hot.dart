import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget hotWidget(
  dynamic hot,
  String name, {
  Function onTap,
  Function onTapBoard,
}) {
  List<Widget> _hot = [];
  List data = hot['data']['topics'];
  _hot.add(
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: duSetFontSize(17),
            fontFamily: 'Montserrat',
            color: AppColors.fontBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
  _hot.add(Container(height: 10));
  for (var i = 0; i < data.length; i++) {
    dynamic item = data[i];
    DateTime lastPostTime =
        DateTime.fromMillisecondsSinceEpoch(item['lastPostTime']);
    _hot.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          padding: EdgeInsets.only(
            left: duSetWidth(15),
            right: duSetWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: duSetWidth(4),
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item['subject'],
                      style: TextStyle(
                        fontSize: duSetFontSize(14),
                        fontFamily: 'Montserrat',
                        color: AppColors.fontBlack,
                      ),
                      children: [
                        if (item['article']['attachments'].length != 0)
                          WidgetSpan(
                            child: Icon(
                              Icons.image_sharp,
                              size: duSetFontSize(20),
                              color: AppColors.fontBlue,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: duSetHeight(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    (item['availables'] - 1 == -1 ? 0 : item['availables'] - 1)
                            .toString() +
                        ' 回复',
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    ("${duTimeLineFormat(lastPostTime)}"),
                    style: TextStyle(
                      fontSize: duSetFontSize(12),
                      fontFamily: 'Avenir',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 0,
                    child: InkWell(
                      onTap: () => onTapBoard(item),
                      child: Text(
                        item['board']['title'] ?? '水木社区',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.fontBlue,
                          fontSize: duSetFontSize(12),
                          fontFamily: 'Avenir',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: duSetHeight(5),
              ),
            ],
          ),
        ),
      ),
    );
    if (i < data.length - 1) {
      _hot.add(Divider());
    }
  }
  if (data.length == 0) {
    _hot.add(Text('暂无数据'));
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: duSetHeight(10)),
    child: SingleChildScrollView(
      child: Column(
        children: _hot,
      ),
    ),
  );
}
