import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
      backgroundColor: Color(0xFFF3F4F6),
      border: Border(
      ),
        middle: Text('Регистрация'),
      ),
     
       
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CupertinoTextField(
            decoration: BoxDecoration(
            color: CupertinoColors.white,
            ),
              placeholder: 'Логин',
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
             Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
             CupertinoTextField(
            decoration: BoxDecoration(
            color: CupertinoColors.white,
            ),
              placeholder: 'Телефон',
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
             Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
             CupertinoTextField(
            decoration: BoxDecoration(
            color: CupertinoColors.white,
            ),
              placeholder: 'Почта',
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
             Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            CupertinoTextField(  
              placeholder: 'Пароль',
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
               suffix: Row(
                 children: [
                   Icon(CupertinoIcons.eye_slash_fill),
                   SizedBox(width: 16.0,),
                 ],
               ),
               ),
            
            SizedBox(height: 447,
            ),
            
            Padding(
  
      padding: AppPaddings.horizontal,
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.main,
        child: Text('Создать аккаунт',
         style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
       ),
     ),
          ],
        ),
      ),
    );
  }
}