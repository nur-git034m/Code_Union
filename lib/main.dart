import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/router/router.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_appl/src/common/dependencies/injection_container.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("tokens");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      theme: CupertinoThemeData(
          primaryColor: CupertinoColors.black,
          scaffoldBackgroundColor: AppColors.scaffoldBackground),
      initialRoute: initialRoute,
    );
  }

  @override
  void initState() {
    Box tokensBox = Hive.box("tokens");
    if (tokensBox.get("access") != null || tokensBox.get("refresh") != null) {
      initialRoute = MainRoute;
    }
    initGetIt();
    super.initState();
  }
}
