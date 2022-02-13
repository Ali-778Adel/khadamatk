import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit_states/login_state.dart';
import 'package:khadamatic_auth/models/auth_model.dart';
import 'package:khadamatic_auth/models/authentication_model.dart';
import 'package:khadamatic_auth/models/login_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  var loginFormKey = GlobalKey<FormState>();
  LoginModel? loginModel;
  //sufixIconLogic
  var IconData = const Icon(Icons.visibility_off_outlined);
  bool obsecureText = true;
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

  //on LoginButton Tapped
  Future<dynamic> onLoginPressed(
      {required BuildContext context,
      required String phone,
      required String password}) async {
    await sendLoginUserData(phone: phone, password: password).onError(
        (error, stackTrace) => print("error on sendLoginData${error.toString()}"
            "${stackTrace.toString()}"));
  } //onLoginPressed

  //login  logic
  var response;
  Future<dynamic> sendLoginUserData({String? phone, String? password}) async {
    emit(LoginLoadingState());
    await AuthenticationDioHelper.sendUserData(
      url: Login,
      data: {
        'phone': phone,
        'password': password,
      },
    ).then((value) {
      response = value.data;
      print('login reponse is ${response.toString()}');
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailureState());
      print('error error error error error ${error.toString()}');
    });
  }

  void setUserDataToSharedPref(
      {String? token, String? name, String? email, String? phoneNumber}) async {
    // ignore: avoid_print
    await SharedPref_Helper.setDataToSharePref(key: 'token', value: token)
        .then((value) => print('token added with $value'));
    await SharedPref_Helper.setDataToSharePref(key: 'name', value: name)
        .then((value) => print('name added with $value'));

    await SharedPref_Helper.setDataToSharePref(key: 'email', value: email)
        .then((value) => print('email added with $value'));

    await SharedPref_Helper.setDataToSharePref(
            key: 'phoneNumber', value: phoneNumber)
        .then((value) => print('phoneNumber added with $value'));
  }
}
