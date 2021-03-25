import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/home/categories.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget categoriesWidget({
  TypeCategoriesResponse categories,
  String categoriesType,
  String categoriesId,
  Function onTap,
}) {
  List list = categories.data.toJson()['data'];
  List<Widget> _categories = [];
  for (var i = 0; i < list.length; i++) {
    dynamic item = list[i];
    _categories.add(
      Container(
        alignment: Alignment.center,
        height: duSetHeight(52),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: GestureDetector(
          child: Text(
            item['name'],
            style: TextStyle(
              color: categoriesId == item['id']
                  ? AppColors.fontBlue
                  : AppColors.fontBlack,
              fontSize: duSetFontSize(18),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () => onTap(item),
        ),
      ),
    );
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(children: _categories),
  );
}
