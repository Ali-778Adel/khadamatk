import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/AppThemes.dart';
import 'package:khadamatic_auth/constants/Bloc_Observer.dart';
import 'package:khadamatic_auth/cubit/login_cubit.dart';
import 'package:khadamatic_auth/cubit/register_cubit.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';
import 'package:khadamatic_auth/screens/login_screen.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AuthenticationDioHelper.initAuthDio();
  Bloc.observer = MyBlocObserver();
  await SharedPref_Helper.initSharedPref();
  bool token = await SharedPref_Helper.getDataFromSharepref(key: 'token');
  bool isFormCompleted=await SharedPref_Helper.getDataFromSharepref(key: 'isFormCompleted');
  print(SharedPref_Helper.getDataFromSharepref(key: 'name').toString());
  print('i print $token' );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  bool ?token;
  bool ?isFormCompleted;
  MyApp({ this.token,this.isFormCompleted, Key? key}) : super(key: key);
  Widget launch() {
    if (token==true&&isFormCompleted==false) {
      return const Scaffold();
    } else if(token==false&&isFormCompleted==false){
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


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: LoginScreen(),
      ),
    );
  }
}

