import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/constants/endpoints.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_states.dart';
import 'package:khadamatic_auth/models/client_orders_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

class TransactionCubit extends Cubit<TransactionStates>{

  TransactionCubit():super(InitialTransactionState());

  static TransactionCubit get(context)=>BlocProvider.of(context);

  ClientOrdersModel? clientOrdersModel;
  
  void getClientOrders(){
    AuthenticationDioHelper.dio!.get(allClientOrders,options: Options(headers:
    {
      'Accept':'application/json',
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9'
          '.eyJhdWQiOiIxIiwianRpIjoiMzcyNTE2YmE5ZDg2YzA0MTJhZDcyZDJkN2M4ZTU2ZjU1M2RjNTU5MzY3ZTgyNTA0OWU0YzkwN2ZkMDg0NTg1NWIxMGE3MzAwODUwMjkwZmUiLCJpYXQiOjE2NDUxNTA5MTEsIm5iZiI6MTY0NTE1MDkxMSwiZXhwIjoxNjc2Njg2OTExLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.dGT3EYvX7JElHVwlwxItifJNS7Ple4jY0M730VjxhnlFh2eYHfuI_mav9Sidbpui4vxPHvgYES2HUEC534Cmx08PCCjzWb2ikMqnJ-8q2Yqo0aFVfXUJA7Pco7FTD8PyMDGKbf4mMtewlYTjapVJ7ZSnAmH7_XxzGAMLQ4VVmCvsG_36MHYrPQoV0vY0Oj3OmEARe1oP791pPuTygyrqzdrkjZgwm5UebKZdhg7-mXZYD7QmEE9K07vq75wkgI9KPJrNlBmUXnoFuYI4FVkkgyQNyzESwmQuR27PGuUcAlAuM2zDKKoCUhOgxyO1CiZa9j7DneDUAWMi3VaSNxonoCwc5tydrrMsk1MLJeiixJd7YPYJPri80d5_LpwaX0K27yYY_CMSCkf7DSkMbxGe9kI8AQYdDSgVNlwzNPAx-xJ_sKmT2kmu8fIRLOE4FXEQsIzMS4tdOyBHsSlcdS7UWx8Dvn7eUtKTqp9OZMoK2XL8-B6TdPvcKnXyOmFon1hWX1G3iMBmuORPXzawtyo6cjLGTOeOExLEI4HCDJuK8pIp0tohfNhrotIh6D4PPfEeoS23FjrE-LY8-sNFrc4_tVrYbBaijqaZYAEnzmbXZC6ULGk7LbvYm-wzkbPZSdI9lmIk6vnwUUB567r3WHYoWwYLpk9NVqtDtKdPz5O7lk0',
    },)).then((value) {
//print(value.data);
clientOrdersModel = ClientOrdersModel.fromJson(value.data);
print(clientOrdersModel);
emit(GetTransactionSuccess(clientOrdersModel!));
    }).catchError((error){
      print(error.toString());
      emit(GetTransactionError(error.toString()));
    });
    
  }
  Color changeTransactionColor(DataClientOrders model){
    if(model.orderType!.type=='finished'){
      return Colors.green;
    }
    else if(model.orderType!.type=='pending'){
      return KJobColor;
    }
    else if(model.orderType!.type =='canceled'){
      return Colors.red;
    }
    else{
      return Colors.white;
    }
  }
}