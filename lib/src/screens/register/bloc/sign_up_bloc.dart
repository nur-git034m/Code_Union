import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appl/src/common/models/tokens_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';


part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final Dio dio;

  SignUpBloc({
    required this.dio,
  }) : super(SignUpInitial());
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is SignUpPressed) {
      yield SignUpLoading();

      try {
        Response response = await dio.post(
          'auth/registration',
          data: {
            "email": event.email,
            "nickname": event.login,
            "phone": event.phone,
            "password": event.password
          },
        );

        TokensModel tokensModel = TokensModel.fromJson(
          response.data['tokens'],
        );

        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);
        yield SignUpLoaded();
      } on DioError catch (e) {
        yield SignUpFailed(message: 'Заполните поля');
        throw e;
      } catch (e) {
        yield SignUpFailed(message: 'Произошла ошибка');
        throw e;
      }
    }
  }
}