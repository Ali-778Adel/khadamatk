import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/settings_cubit/settings_cubit.dart';
import 'package:khadamatic_auth/cubit/settings_cubit/settings_states.dart';
import 'package:khadamatic_auth/screens/login_screen.dart';
import 'package:khadamatic_auth/sharedpref/sharedpref.dart';

import '../models/client_profile_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return BlocProvider(create:(context) => SettingsCubit()..getClientProfile(),child:
  BlocConsumer<SettingsCubit,SettingsStates>(
    listener: (context, state) {

    },
    builder: (context,state){
      if(state is GetClientProfileSuccessState) {
        return buildSettings(context,state.clientProfileModel.data!);
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    },
  ),
  );
  }

  Widget buildSettings(context,Data model){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius
                      .circular(100),color:KMainColor,
                      image: DecorationImage(image: AssetImage
                        ('assests/logos/logo4.png'),fit: BoxFit.cover),border:
                      Border.all(color: KMainColor,width: 2.5)),
                ),
                CircleAvatar(
                  radius: 20,backgroundColor: KMainColor,
                  child: Icon(Icons.camera_alt,color: KJobColor),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(model.name!,style: Theme.of(context).textTheme
                    .headline5!.copyWith(color: KMainColor),),
                SizedBox(width: 5),
                Icon(Icons.edit,color: Colors.grey,),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.vpn_key_sharp,color: Colors.grey,size: 30,),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){}, child:Text('Change '
                          'Password',style: Theme.of(context).textTheme
                          .headline5!.copyWith(color: KMainColor,fontSize: 20)
                        ,)),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.doorbell_outlined,color: Colors.grey,size: 30,),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){}, child:Text('Notifications',
                        style: Theme
                            .of(context).textTheme
                            .headline5!.copyWith(color: KMainColor,fontSize: 20)
                        ,)),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.language,color: Colors.grey,size: 30,),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){}, child:Text('Change Language',
                        style: Theme
                            .of(context).textTheme
                            .headline5!.copyWith(color: KMainColor,fontSize: 20)
                        ,)),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.account_balance_wallet_rounded,color: Colors.grey,size: 30,),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){}, child:Text('my wallet',
                        style: Theme
                            .of(context).textTheme
                            .headline5!.copyWith(color: KMainColor,fontSize: 20)
                        ,)),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.logout,color: Colors.grey,size: 30,),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){
                        SharedPref_Helper.sharedPreferences!.remove('token')
                            .then((value) {
                              Navigator.of(context).pushAndRemoveUntil
                                (MaterialPageRoute(builder:(context) =>
                              LoginScreen(),), (route) => false);
                        });
                      }, child:Text('Logout',
                        style: Theme
                            .of(context).textTheme
                            .headline5!.copyWith(color: KMainColor,fontSize: 20)
                        ,)),

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
