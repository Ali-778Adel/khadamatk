
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/layout_cubit/layout_cubit.dart';
import 'package:khadamatic_auth/cubit/layout_cubit/layout_states.dart';
import 'package:khadamatic_auth/screens/credit_card_screen.dart';
import 'package:khadamatic_auth/screens/settings_screen.dart';
import 'package:khadamatic_auth/screens/transactions_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constants/AppThemes.dart';
import '../constants/constants.dart';
import 'home_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);


  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout > {




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => LayoutCubit(),
      //create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context, state) {

        },
        builder: (context,state){
        var cubit =  LayoutCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Image.asset('assests/logos/logo4.png'),
            ),
            body: cubit.screens[cubit.selectedIndex],
            bottomNavigationBar: SalomonBottomBar(
              items: [
                SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text("Home"),
                    selectedColor: KMainColor,
                    unselectedColor: KUnselectedColor
                ),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.folder),
                    title: const Text("Transactions"),
                    selectedColor: KMainColor,
                    unselectedColor: KUnselectedColor
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.credit_card),
                  title: const Text("Credit"),
                  selectedColor: KMainColor,
                  unselectedColor: KUnselectedColor,
                ),
                SalomonBottomBarItem(
                    icon: const Icon(Icons.settings),
                    title: const Text("Setting"),
                    selectedColor: KMainColor,
                    unselectedColor: KUnselectedColor

                ),
              ],
              currentIndex: cubit.selectedIndex,
              selectedItemColor: Colors.black,
              onTap:(index)=> cubit.navBarChanger(index),
            ),
          );
        },
      ),
    );
  }
}