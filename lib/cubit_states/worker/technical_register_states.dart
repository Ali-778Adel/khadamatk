import 'package:khadamatic_auth/models/authentication_model.dart';

import '../../models/technical_register_model.dart';
abstract class TechnicalRegisterStates{}
class TRegisterInitState extends TechnicalRegisterStates{}
class PasswordsVisibilityState extends TechnicalRegisterStates {}
class RegisterLoadingState extends TechnicalRegisterStates {}
class RegisterSuccessState extends TechnicalRegisterStates {
  final TechnicalRegisterModel technicalRegisterModel;
  RegisterSuccessState(this.technicalRegisterModel);
}
class RegisterFailureState extends TechnicalRegisterStates {
  final TechnicalRegisterModel technicalRegisterModel;
  RegisterFailureState(this.technicalRegisterModel);
}
