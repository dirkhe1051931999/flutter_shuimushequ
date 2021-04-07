import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shuimushequ/common/type/search/account.dart';
import 'package:shuimushequ/common/utils/index.dart';
import 'package:shuimushequ/common/values/index.dart';

Widget accountWidget({
  TypeSearchAccountResponse accounts,
  Function onTapUser,
  Function onTapFollow,
  Function onTapUnFollow,
}) {
  List<Widget> _accounts = [];
  List result = accounts.data.toJson()['accounts'];
  for (var i = 0; i < result.length; i++) {
    dynamic item = result[i];
    dynamic nickname = parse(item['name']).body.text;
    dynamic intro = parse(item['nick']).body.text;
    _accounts.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: duSetHeight(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTapUser(item),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      item['avatarUrl'] + '?w=80&h=80',
                      width: duSetWidth(38),
                      height: duSetHeight(38),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: duSetHeight(5)),
                          child: Text(
                            nickname,
                            style: TextStyle(
                              fontSize: duSetFontSize(18.5),
                              fontFamily: 'Montserrat',
                              color: AppColors.fontBlack,
                            ),
                          ),
                        ),
                        Text(
                          intro,
                          style: TextStyle(
                            fontSize: duSetFontSize(14),
                            fontFamily: 'Montserrat',
                            color: AppColors.subGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            !item['isFans']
                ? TextButton(
                    onPressed: () => onTapFollow(item),
                    clipBehavior: Clip.hardEdge,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: AppColors.fontBlue),
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: duSetFontSize(20),
                          color: AppColors.fontBlue,
                        ),
                        Text(
                          "关注",
                          style: TextStyle(
                            fontSize: duSetFontSize(14),
                            fontFamily: 'Montserrat',
                            color: AppColors.fontBlue,
                          ),
                        ),
                      ],
                    ),
                  )
                : TextButton(
                    onPressed: () => onTapUnFollow(item),
                    clipBehavior: Clip.hardEdge,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: AppColors.red),
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.close,
                          size: duSetFontSize(20),
                          color: AppColors.red,
                        ),
                        Text(
                          "取消关注",
                          style: TextStyle(
                            fontSize: duSetFontSize(14),
                            fontFamily: 'Montserrat',
                            color: AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
    if (i < result.length - 1) {
      _accounts.add(Divider());
    }
  }
  return Padding(
    padding: EdgeInsets.only(bottom: duSetHeight(10)),
    child: Column(
      children: _accounts,
    ),
  );
}
