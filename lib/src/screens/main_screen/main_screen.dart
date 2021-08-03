import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/screens/auth/auth_screen.dart';
import 'package:flutter_appl/src/screens/profile/profile_screen.dart';
import 'package:flutter_appl/src/screens/register/register_screen.dart';
import 'package:flutter_appl/src/screens/timeline/timeline_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.timelapse)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.map)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled)),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return TimelineScreen();
                case 1:
                  return RegisterScreen();
                case 2:
                  return AuthScreen();
                case 3:
                  return ProfileScreen();
                default:
                  return RegisterScreen();
              }
            },
          );
        },
      ),
    );
  }
}
