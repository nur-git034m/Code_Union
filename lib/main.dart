import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/router/router.dart';
import 'package:flutter_appl/src/screens/main_screen/main_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouter.generateRoute,
      home: MainScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
