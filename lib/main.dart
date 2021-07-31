import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/router/router.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
   await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute =AuthRoute;

@override
  void initState() {
    Box tokensBox = Hive.box('tokens');
    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      initialRoute =MainRoute;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AuthRoute,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
