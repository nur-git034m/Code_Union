import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appl/src/common/constants/app_color.dart';
import 'package:flutter_appl/src/common/constants/app_paddings.dart';
import 'package:flutter_appl/src/common/widgets/custom_button.dart';
import 'package:flutter_appl/src/common/widgets/custom_divider.dart';
import 'package:flutter_appl/src/common/widgets/custom_text_field.dart';
import 'package:flutter_appl/src/router/routing_const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_up_bloc.dart';


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController loginController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        border: Border(),
        middle: Text("Регистрация"),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomTextField(
                  placeholder: "Логин",
                  controller: loginController,
                ),
                CustomDivider(),
                CustomTextField(
                  placeholder: "Телефон",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                CustomDivider(),
                CustomTextField(
                  placeholder: "Почта",
                  controller: emailController,
                ),
                CustomDivider(),
                CustomTextField(
                  placeholder: "Пароль",
                  controller: passwordController,
                  obscureText: true,
                ),
              ],
            ),
            Padding(
              padding: AppPaddings.horizontal,
              child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                  // TODO: implement listener
                  if (state is SignUpLoaded) {
                    Navigator.pushReplacementNamed(context, MainRoute);
                  } else if (state is SignUpFailed) {
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
                    labelText: "Создать аккаунт",
                    onPressed: state is SignUpLoading
                        ? null
                        : () {
                            context.read<SignUpBloc>().add(SignUpPressed(
                                  login: loginController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ));
                          },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}