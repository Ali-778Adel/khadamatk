
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/AppThemes.dart';
import 'package:khadamatic_auth/constants/Bloc_Observer.dart';
import 'package:khadamatic_auth/cubit/login_cubit.dart';
import 'package:khadamatic_auth/cubit/client_register_cubit.dart';
import 'package:khadamatic_auth/cubit/worker/worker_homepage_cubit.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/screens/app_layout.dart';
import 'package:khadamatic_auth/screens/client_technical_option.dart';
import 'package:khadamatic_auth/screens/login_screen.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';

import 'cubit/worker/technical_register_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationDioHelper.initAuthDio();
  Bloc.observer = MyBlocObserver();
  await SharedPref_Helper.initSharedPref();
  String token = await SharedPref_Helper.getDataFromShareprefrences(key: 'token') ?? 'no token is saved yet login to save your token !';
  bool isFormCompleted=await SharedPref_Helper.getDataFromSharepref(key: 'isFormCompleted');
  print(SharedPref_Helper.getDataFromSharepref(key: 'name').toString());
  print('i print $token' );
  runApp( MyApp(token:  token,));
}

class MyApp extends StatelessWidget {
  String ?token;
  bool ?isFormCompleted;
  MyApp({ this.token,this.isFormCompleted, Key? key}) : super(key: key);
  Widget launch() {
    if (token!=null) {
      print('App Layout Selected');
      return const AppLayout();
    } else if(token==null&&isFormCompleted==false){
      return LoginScreen();
    }else{
      return Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => TechnicalRegisterCubit()),
        BlocProvider(create: (context) => WorkerHomePageCubit()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: launch(),
      ),
    );
  }
}

