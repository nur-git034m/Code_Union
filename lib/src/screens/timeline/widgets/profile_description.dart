import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/text_styles.dart';

class ProfileDescription extends StatelessWidget {
  final String imagePath;
  final String name;
  final String email;

  const ProfileDescription({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 38,
        ),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: AppTextStyles.headline1
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          email,
          textAlign: TextAlign.center,
          style: AppTextStyles.description1
        ),
      ],
    );
  }
}