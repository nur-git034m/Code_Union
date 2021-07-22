import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:flutter_appl/src/screens/auth/auth_screen.dart';
import 'package:flutter_appl/src/screens/auth/register_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}