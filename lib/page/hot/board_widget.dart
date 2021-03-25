import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/hot/board.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget HotBoardWidget({
  TypeHotBoardResponse boards,
  Function onTap,
}) {
  List data = boards.toJson()['data'];
  List<Widget> _boards = [];
  for (var i = 0; i < data.length; i++) {
    dynamic item = data[i];
    _boards.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: Radii.k6pxRadius,
          ),
          alignment: Alignment.center,
          height: duSetHeight(140),
          width: duSetWidth(130),
          margin: EdgeInsets.symmetric(
              vertical: duSetHeight(10), horizontal: duSetWidth(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Icon(
                      Iconfont.duobianxing,
                      color: i == 0
                          ? Color.fromRGBO(239, 98, 98, 1.000)
                          : i == 1
                              ? Color.fromRGBO(246, 162, 11, 1.000)
                              : i == 2
                                  ? Color.fromRGBO(0, 151, 229, 1.000)
                                  : AppColors.tabBarElement,
                      size: duSetFontSize(30),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontSize: duSetFontSize(14),
                        color: AppColors.white,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: duSetHeight(14), bottom: duSetHeight(10)),
                child: Text(item['title']),
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.bgGrey,
                  borderRadius: Radii.k10pxRadius,
                ),
                child: Text(
                  '今日文章',
                  style: TextStyle(
                    fontSize: duSetFontSize(12),
                    fontFamily: 'Montserrat',
                    color: AppColors.subGrey,
                    // backgroundColor: AppColors.bgGrey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: duSetHeight(10),
                  bottom: duSetHeight(10),
                ),
                child: Text(
                  item['popularity'].toString(),
                  style: TextStyle(
                    fontSize: duSetFontSize(20),
                    fontFamily: 'Montserrat',
                    color: AppColors.fontBlack,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: _boards),
  );
}
