part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {
  
}
class SignUpPressed extends SignUpEvent{
  final String? login;
  final String? phone;
  final String? email;
  final String? password;

  SignUpPressed({this.login, this.phone, this.email, this.password});
}