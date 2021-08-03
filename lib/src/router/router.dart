
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/dependencies/injection_container.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:flutter_appl/src/screens/auth/auth_screen.dart';
import 'package:flutter_appl/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_appl/src/screens/register/bloc/sign_up_bloc.dart';
import 'package:flutter_appl/src/screens/register/register_screen.dart';
import 'package:flutter_appl/src/screens/main_screen/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
             create: (context) => LogInBloc(
                dio: getIt<Dio>(),
             ),
           child: AuthScreen(),
          ),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => SignUpBloc(dio: getIt<Dio>(),),
                child: RegisterScreen(),
              ),
        );
      case MainRoute:
        return CupertinoPageRoute(builder: (context) => MainScreen());
      default:
        return CupertinoPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => LogInBloc(dio: getIt<Dio>()),
                child: AuthScreen(),
              ),
        );
    }
  }
}