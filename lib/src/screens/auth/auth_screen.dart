import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';
import 'package:flutter_appl/src/router/routing_const.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
      backgroundColor: Color(0xFFF3F4F6),
      border: Border(),
        middle: Text('Авторизация'),
  
      ),
    

      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: 32,
            ),
            CustomTextField(),
             Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            CupertinoTextField(
              placeholder: 'Пароль',
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
            SizedBox(height: 32,
            ),
            
            Padding(
      padding: AppPaddings.horizontal,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.main,
        child: Text('Войти',
         style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
       ),
     ),
             SizedBox(height: 19,
            ),
            Padding(
      padding: AppPaddings.horizontal,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.main,
      
        child: Text('Зарегистрироваться',
         style: TextStyle(
           fontWeight: FontWeight.bold,
         ),
        ),
        onPressed: () {
        Navigator.pushNamed(context, RegisterRoute);
        },
      ),
      ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    key,
    this.placeholder = 'Введите',
  }) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
    );
  }
}