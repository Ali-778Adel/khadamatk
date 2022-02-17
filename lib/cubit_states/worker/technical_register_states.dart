import 'package:khadamatic_auth/models/authentication_model.dart';
abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}
class PasswordsVisibilityState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {
  final AuthenticationModel authenticationModel;
  RegisterSuccessState(this.authenticationModel);
}
class RegisterFailureState extends RegisterStates {
  final AuthenticationModel authenticationModel;
  RegisterFailureState(this.authenticationModel);
}
