import 'package:flutter/cupertino.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';
import 'package:flutter_appl/src/common/widgets/custom_button.dart';
import 'package:flutter_appl/src/common/widgets/custom_divider.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appl/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

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
            SizedBox(
              height: 32,
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
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: AppPaddings.horizontal,
              child: BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is LogInLoaded) {
                    Navigator.pushNamed(context, MainRoute);
                  } else if (state is LogInFailed) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(state.message ?? ''),
                          actions: [
                            CupertinoButton(
                              child: Text('ОК'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    labelText: "Войти",
                    onPressed: state is LogInLoading
                        ? null
                        : () {
                            context.read<LogInBloc>().add(LogInPressed(
                                password: passwordController.text,
                                email: emailController.text));
                          },
                  );
                },
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Padding(
              padding: AppPaddings.horizontal,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: AppColors.main,
                child: Text(
                  'Зарегистрироваться',
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
    required TextEditingController controller,
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
