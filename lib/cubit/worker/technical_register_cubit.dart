import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';
import '../../cubit_states/worker/technical_register_states.dart';
import '../../models/technical_register_model.dart';

class TechnicalRegisterCubit extends Cubit<TechnicalRegisterStates> {
  TechnicalRegisterCubit() : super(TRegisterInitState());
  static TechnicalRegisterCubit get(context) => BlocProvider.of(context);
  var registerFormKey = GlobalKey<FormState>();
  TechnicalRegisterModel ?technicalRegisterModel;
  bool obsecureText = true;
  var IconData = const Icon(Icons.visibility_off_outlined);
  void onPasswordSuffixIconTaped() {
    if (obsecureText) {
      IconData = const Icon(Icons.visibility_outlined);
      obsecureText = false;
    } else {
      IconData = const Icon(Icons.visibility_off_outlined);
      obsecureText = true;
    }
    emit(PasswordsVisibilityState());
  }

  Future<dynamic> onRegisterPressed(
      {required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String phone}) async {
    await sendregisterUserData(
        context: context,
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        phone: phone,
      );
  }

  Future<dynamic> sendregisterUserData(
      {required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String phone}) async {
    emit(RegisterLoadingState());
    await AuthenticationDioHelper.sendUserData(url: TechnicalRegister, data: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'sub_category_id':'2',
      'description':'نجار',
      'type':'2',
      'area_id':'1',
    }).then((value) {
      var response = value.data;
      print('response  is${response.toString()}');
      technicalRegisterModel=TechnicalRegisterModel.fromJson(value.data);
      print(technicalRegisterModel!.data!.user!.email);
      print('response  is${response.toString()}');
      setUserDataToSharedPref(
          token: technicalRegisterModel!.data!.token,
          name: technicalRegisterModel!.data!.user!.name,
          email:technicalRegisterModel!.data!.user!.email,
          phoneNumber:technicalRegisterModel!.data!.user!.phone);
      emit(RegisterSuccessState(technicalRegisterModel!));
    }).catchError((error) {
      emit(RegisterFailureState(technicalRegisterModel!));
      print('error on send sendregisterUserData ${error.toString()}');

    });
  }

  void setUserDataToSharedPref(
      {String? token, String? name, String? email, String? phoneNumber}) async {
    // ignore: avoid_print
    await SharedPref_Helper.setDataToSharePref(key: 'token', value: token)
        .then((value) => print('token added with $value')).catchError((error){print('error on et token${error.toString()}');});
    await SharedPref_Helper.setDataToSharePref(key: 'name', value: name)
        .then((value) => print('name added with $value')).catchError((error){print('error on et token${error.toString()}');});;

    await SharedPref_Helper.setDataToSharePref(key: 'email', value: email)
        .then((value) => print('email added with $value')).catchError((error){print('error on et token${error.toString()}');});;

    await SharedPref_Helper.setDataToSharePref(
            key: 'phoneNumber', value: phoneNumber)
        .then((value) => print('phoneNumber added with $value')).catchError((error){print('error on et token${error.toString()}');});;
  }
}
