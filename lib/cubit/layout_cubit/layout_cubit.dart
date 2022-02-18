import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_cubit.dart';
import 'package:khadamatic_auth/cubit/layout_cubit/layout_states.dart';

import '../../screens/credit_card_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/transactions_screen.dart';


class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());

 static LayoutCubit get(context)=> BlocProvider.of(context);

    List<Widget>screens= <Widget>[
     HomeScreen(),
    TransactionsScreen(),
    CreditCardScreen(),
    SettingsScreen()
  ];

  int selectedIndex = 0;
  void navBarChanger(int index) {
      selectedIndex = index;
      emit(NavBarChangerState());
  }
}