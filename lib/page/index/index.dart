import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuimushequ/common/router/application.dart';
import 'package:shuimushequ/common/router/index.dart';
import 'package:shuimushequ/page/application/index.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    print('index init');
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    return ScreenUtilInit(
      designSize: Size(375, 734), // 812 - 44 - 34 = 734
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: '水木社区',
        home: Scaffold(body: ApplicationPage()),
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
