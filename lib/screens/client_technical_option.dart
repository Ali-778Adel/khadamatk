import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadamatic_auth/screens/register_screen.dart';
import 'package:khadamatic_auth/screens/worker/tecnical_register_screen.dart';
import 'package:khadamatic_auth/screens/worker/worker_homepage.dart';
class ClientTechnicalOptionScreen extends StatelessWidget {
  const ClientTechnicalOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
        const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(5),
            child: Image.asset('assests/logos/logo4.png',fit: BoxFit.contain,),
          ),
          const SizedBox(height: 60,),
          Container(
            height: 220,
           width: MediaQuery.of(context).size.width,
           margin:const EdgeInsets.fromLTRB(20, 0, 20, 120),
           decoration:const BoxDecoration(
               color: FlexColor.indigoLightPrimaryVariant,
               borderRadius: BorderRadiusDirectional.all(Radius.circular(10))
           ),
           child: Container(
             margin: const EdgeInsets.all(10),
             padding: const EdgeInsets.all(5),
             child: Row(
               children: [
                 Expanded(
                   flex: 1,
                     child: IconButton(
                       iconSize: 220,
                       icon: Container(
                         
                           height: 220,
                           width: MediaQuery.of(context).size.width*.5,
                           decoration:const BoxDecoration(
                             color: FlexColor.indigoLightPrimaryVariant,
                             boxShadow: [
                               BoxShadow(
                                 color:FlexColor.blueDarkSecondary,
                                 offset: Offset(.1, 0.2),
                                 blurRadius: 1,
                                 spreadRadius: 1


                               )
                             ]
                           ),
                           child: Column(
                             children: [
                               Image.asset('assests/material/client1.png',
                                 height: 120,
                                 width: MediaQuery.of(context).size.width*.5,
                                 filterQuality: FilterQuality.high,
                                 fit: BoxFit.fill,),
                               const SizedBox(height: 5,),
                               Center(child: Container(
                                   height: 30,
                                   width: 80,
                                   padding:const EdgeInsets.all(5),
                                   decoration:const BoxDecoration(
                                       color: FlexColor.blueDarkSecondary,
                                       borderRadius: BorderRadiusDirectional.all(Radius.circular(5))
                                   ),
                                   child:const Text('Client',
                                     textAlign: TextAlign.center,
                                     style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),)
                             ],
                           ))
                       ,onPressed: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=> ClientRegisterScreen()) );
                     },)),
                 Expanded(
                     flex: 1,
                     child: IconButton(
                       iconSize: 220,
                       icon: Container(
                         height: 220,
                         width: MediaQuery.of(context).size.width*.5,
                           decoration:const BoxDecoration(
                               color: FlexColor.indigoLightPrimaryVariant,
                               boxShadow: [
                                 BoxShadow(
                                     color:FlexColor.blueDarkSecondary,
                                     offset: Offset(.1, 0.2),
                                     blurRadius: 1,
                                     spreadRadius: 1


                                 )
                               ]
                           ),
                         child: Column(
                           children: [
                             Image.asset('assests/material/worker1.png',
                               height: 120,
                               width: MediaQuery.of(context).size.width*.5,
                               filterQuality: FilterQuality.high,
                               fit: BoxFit.fill,),
                              const SizedBox(height: 5,),
                              Center(child: Container(
                                height: 30,
                                  width: 80,
                                  padding: EdgeInsets.all(5),
                                  decoration:const BoxDecoration(
                                    color: FlexColor.blueDarkSecondary,
                                      borderRadius: BorderRadiusDirectional.all(Radius.circular(5))
                                  ),
                                  child:const Text('Factor',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),)
                           ],
                         ))
                       ,onPressed: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=> TechnicalRegisterScreen()) );
                     },))

               ],
             ),
           ),
         )

        ],
      ),
    );
  }
}
