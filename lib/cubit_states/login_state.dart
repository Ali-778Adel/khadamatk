
import 'package:khadamatic_auth/models/auth_model.dart';
import 'package:khadamatic_auth/models/authentication_model.dart';
import 'package:khadamatic_auth/models/login_model.dart';

abstract class LoginStates{}

class LoginIntialState extends LoginStates {}

class PasswordsVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
   LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

class LoginFailureState extends LoginStates {
  final LoginModel loginModel;
  LoginFailureState(this.loginModel);
}
