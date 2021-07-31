import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';


class CustomTextField extends StatelessWidget {
  final String placeholder;
  final Widget? suffix;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.placeholder = "Введите",
    this.suffix,
    this.controller, keyboardType, obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      suffix: suffix,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
    );
  }
}