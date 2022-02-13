
import 'package:khadamatic_auth/models/auth_model.dart';

abstract class LoginStates{}

class LoginIntialState extends LoginStates {}

class PasswordsVisibilityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final AuthModel authModel;
  LoginSuccessState(this.authModel);
}

class LoginFailureState extends LoginStates {
 String? errorMessage;
 LoginFailureState({this.errorMessage});
}
