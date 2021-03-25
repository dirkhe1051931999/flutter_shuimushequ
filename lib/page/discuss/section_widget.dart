import 'package:flutter/material.dart';
import 'package:shuimushequ/common/type/discuss/section.dart';

Widget SectionWidget({TypeDiscussSectionResponse discuss, Function onTap}) {
  List sections = discuss.toJson()['data']['sections'];
  List<Widget> _discuss = [];
  for (var i = 0; i < sections.length; i++) {
    dynamic item = sections[i];
    _discuss.add(Container(
      child: Row(
        children: <Widget>[Icon(Icons.subject), Text(item['name'])],
      ),
    ));
  }
  return Column(
    children: _discuss,
  );
}
