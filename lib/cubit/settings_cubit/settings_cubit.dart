import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/settings_cubit/settings_states.dart';
import 'package:khadamatic_auth/models/client_profile_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

class SettingsCubit extends Cubit<SettingsStates>{
  SettingsCubit():super(InitialSettingsState());
  
  static SettingsCubit get(context)=>BlocProvider.of(context);
  
  ClientProfileModel? clientProfileModel;
void getClientProfile(){
  emit(GetClientProfileLoading());
  AuthenticationDioHelper.dio!.get(clientProfile,options: Options(headers:
  {'Accept':'application/json','Authorization':'Bearer $token'})).then((value)
  {
    print(value.data);
    clientProfileModel = ClientProfileModel.fromJson(value.data);
    emit(GetClientProfileSuccessState(clientProfileModel!));
  })
      .catchError((error){
    print(error.toString());
    emit(GetClientProfileErrorState(error.toString()));
  });
}

}