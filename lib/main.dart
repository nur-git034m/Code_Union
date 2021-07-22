import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/color_constants.dart';
import 'package:flutter_appl/src/router/router.dart';
import 'package:flutter_appl/src/screens/auth/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouter.generateRoute,
      home: AuthScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
    );
  }
}
