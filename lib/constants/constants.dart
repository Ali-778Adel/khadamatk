import 'dart:ui';

import '../sharedpref/sharedpref.dart';

const Color KMainColor = Color(0xff0503A0);
const Color KJobColor = Color(0xff02d5ed);
const Color KUnselectedColor = Color(0xffCCCCCc);

late String token =  SharedPref_Helper.getDataFromShareprefrences(key: 'token');
