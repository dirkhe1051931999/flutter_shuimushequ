import 'package:flutter/material.dart';
import 'package:shuimushequ/common/utils/date.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget listWidget(
  dynamic list, {
  Function onTapItem,
}) {
  List<Widget> _list = [];
  for (var i = 0; i < list.length; i++) {
    dynamic item = list[i];
    DateTime flushTime = DateTime.fromMillisecondsSinceEpoch(item['flushTime']);
    _list.add(
      GestureDetector(
        onTap: () => onTapItem(item),
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Text(
                    item['subject'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: duSetFontSize(16),
                      fontFamily: 'Montserrat',
                      color: AppColors.fontBlack,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    (item['availables'] - 1).toString() + ' 回复',
                    style: TextStyle(
                      fontSize: duSetFontSize(10),
                      fontFamily: 'Montserrat',
                      color: AppColors.subGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: duSetWidth(10)),
                    child: Text(
                      ("${duTimeLineFormat(flushTime)}"),
                      style: TextStyle(
                        fontSize: duSetFontSize(10),
                        fontFamily: 'Montserrat',
                        color: AppColors.subGrey,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    if (i < list.length - 1) {
      _list.add(Divider());
    }
  }
  return Column(
    children: _list,
  );
}
