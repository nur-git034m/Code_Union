import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:flutter_appl/src/screens/auth/register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({key}) : super(key: key);

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
            CupertinoTextField(
            decoration: BoxDecoration(
            color: CupertinoColors.white,
            ),
              placeholder: 'Логин или почта',
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
            ),
            SizedBox(height: 32,
            ),
            
            Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: Color(0xFF4631D2),
        child: Text('Войти',
         style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
       ),
     ),
             SizedBox(height: 19,
            ),
            Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: Color(0xFF4631D2),
      
        child: Text('Зарегистрироваться',
         style: TextStyle(
           fontWeight: FontWeight.bold,
         ),
        ),
        onPressed: () {
        Navigator.pushNamed(context, RegisterRoute);
        },
      ),),
          ],
        ),
      ),
    );
  }
}