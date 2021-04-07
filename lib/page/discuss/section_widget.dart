import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/discuss/section.dart';
import 'package:shuimushequ/common/utils/hexColor.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/colors.dart';

Widget SectionWidget({
  TypeDiscussSectionResponse discuss,
  Function onTap,
  id: String,
  double height,
}) {
  List sections = discuss.toJson()['data']['sections'];
  List<Widget> _discuss = [];
  List<IconData> icons = [
    Icons.widgets,
    Icons.school,
    Icons.games,
    Icons.wb_sunny,
    Icons.videogame_asset,
    Icons.location_city,
    Icons.mood,
    Icons.book,
    Icons.science,
    Icons.personal_video,
  ];
  List<Color> colors = [
    HexColor('#00b8ff'),
    HexColor('#15cebf'),
    HexColor('#f86767'),
    HexColor('#f86767'),
    HexColor('#b36df1'),
    HexColor('#ffa400'),
    HexColor('#fb5daa'),
    HexColor('#15cebf'),
    HexColor('#ffa400'),
    HexColor('#00b8ff'),
  ];
  for (var i = 0; i < sections.length; i++) {
    dynamic item = sections[i];
    _discuss.add(
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(item),
        child: Container(
          width: duSetWidth(110),
          height: duSetHeight(50),
          decoration: BoxDecoration(
            color: id == item['id'] ? AppColors.bgGrey : AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: duSetWidth(10)),
                child: Icon(
                  icons[i] ?? icons[0],
                  color: colors[i] ?? colors[0],
                  size: duSetFontSize(20),
                ),
              ),
              Text(
                item['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fontBlack,
                  fontFamily: 'Montserrat',
                  fontSize: duSetFontSize(14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  return Container(
    height: duSetHeight(height),
    color: AppColors.white,
    child: Column(
      children: _discuss,
    ),
  );
}
