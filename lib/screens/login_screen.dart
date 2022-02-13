
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/components/ToastMessage.dart';
import 'package:khadamatic_auth/cubit/login_cubit.dart';
import 'package:khadamatic_auth/cubit_states/login_state.dart';
import 'package:khadamatic_auth/screens/register_screen.dart';
import 'package:khadamatic_auth/widgets/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final  loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<LoginCubit, LoginStates>(
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            Widget checkState(){
              if (state is LoginLoadingState){
                return const Center(child:  CircularProgressIndicator());
              }else{
                return CustomElvateButton(
                  buttonText: 'Log in',
                  function: (){
                    cubit.onLoginPressed(context: context,
                        phone: loginEmailController.text,
                        password: loginPasswordController.text);

                  },

                );
              }

            }


            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: cubit.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Log In',
                        style: (Theme.of(context).textTheme.headline4)!
                            .copyWith(color: Colors.black87),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Dementia is the best solution for you.',
                        style: (Theme.of(context).textTheme.headline6)!
                            .copyWith(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //email
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2))
                            ]),
                        child: TextFormField(
                          controller: loginEmailController,
                          decoration: const InputDecoration(
                            fillColor: Colors.limeAccent,
                            constraints:
                            BoxConstraints(minWidth: 120, maxWidth: 600),
                            icon: Icon(Icons.email),
                            labelText: 'phone',
                            hintText: 'Enter your phone number ',
                          ),
                          validator: (String? message) {
                            if (loginEmailController.text.isEmpty) {
                              return message = "phone number field musn't be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //password
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2))
                            ]),
                        child: TextFormField(
                          controller: loginPasswordController,
                          decoration: InputDecoration(
                            fillColor: Colors.limeAccent,
                            constraints: const BoxConstraints(
                                minWidth: 120, maxWidth: 600),
                            icon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: cubit.IconData,
                              onPressed: () {
                                cubit.onPasswordSuffixIconTaped();
                              },
                            ),
                            labelText: 'Password',
                            hintText: 'Password ',
                          ),
                          obscureText: cubit.obsecureText,
                          validator: (String? message) {
                            if (message!.isEmpty) {
                              return message = "password musn't be empty";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(child: SizedBox(
                          width: 120,
                          child: checkState()
                      )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Don't have an account ?",
                              style: (Theme.of(context).textTheme.headline6)!
                                  .copyWith(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              child: Text(
                                'REGISTER NOW',
                                style: (Theme.of(context).textTheme.headline6)!
                                    .copyWith(color: Colors.red, fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginLoadingState){
              HandleToastMeaasge.showToastMessage(context:context,message: 'loading ...', enumState: EnumState.WARNING);
            }
            else if (state is LoginSuccessState) {
                HandleToastMeaasge.showToastMessage(
                    context: context,
                    message: ' you logged in successfully',
                    enumState: EnumState.SUCCESS);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>const Scaffold(body: Center(child: Text('Client Side 2',style:TextStyle(color: Colors.red,fontSize: 40),),),)),
                );

            } else if (state is LoginFailureState) {
                HandleToastMeaasge.showToastMessage(
                    context: context,
                    message: ('${LoginCubit.get(context).response}'
                        'البانات المدخلة غير صحيحة  '


                    ),
                    enumState: EnumState.ERROR);
              }
            }
        ));
  }
}
