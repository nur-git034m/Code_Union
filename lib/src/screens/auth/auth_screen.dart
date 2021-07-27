import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';
import 'package:flutter_appl/src/common/widgets/custom_divider.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

   Dio dio = Dio();
  
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            CustomTextField(
              controller: emailController,
              placeholder: "Логин или почта",
            ),
            CustomDivider(),
             Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            CupertinoTextField(
              controller: passwordController,
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
        onPressed: () async {
          Box tokensBox = Hive.box('tokens');
            tokensBox.put('access', 'testovaya_zapis');
            print(tokensBox.get('access'));
          print(emailController.text);
          try{
          Response response = await dio.post(
      'http://api.codeunion.kz/api/v1/auth/login',
      data: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
     print(response.data['tokens']['accessToken']);
     
      tokensBox.put('access', response.data['tokens']['accessToken']);
      tokensBox.put('refresh', response.data['tokens']['refreshToken']);
      print(tokensBox.get('access'));
      print(tokensBox.get('refresh'));
      Navigator.pushReplacementNamed(context, MainRoute);
        } on DioError catch (e) {
          print(e.response!.data);
           showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Ошибка'),
          content: Text('Неправильный логин или пароль!'),
          actions: [
            CupertinoButton(
              child: Text('ОК'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
          throw e;
        }
        },
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
    this.placeholder = 'Введите', required TextEditingController controller,
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