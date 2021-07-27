import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/screens/timeline/widgets/profile_description.dart';
import 'package:flutter_appl/src/screens/timeline/widgets/profile_screen_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text("Профиль"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileDescription(
            imagePath:"assets/images/profile.jpg",
            name: "Nurgeldi Sertay",
            email: "nur034m@gmail.com",
          ),
          SizedBox(
            height: 27,
          ),
          ProfileScreenButton(
            // Выйти
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}