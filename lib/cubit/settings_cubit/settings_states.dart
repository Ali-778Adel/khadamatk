import 'package:khadamatic_auth/models/client_profile_model.dart';

abstract class SettingsStates {}
class InitialSettingsState extends SettingsStates{}
class GetClientProfileSuccessState extends SettingsStates{
  final ClientProfileModel clientProfileModel;

  GetClientProfileSuccessState(this.clientProfileModel);
}
class GetClientProfileErrorState extends SettingsStates{
  final String error;

  GetClientProfileErrorState(this.error);
}
class GetClientProfileLoading extends SettingsStates{}