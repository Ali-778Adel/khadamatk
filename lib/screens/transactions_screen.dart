import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_cubit.dart';
import 'package:khadamatic_auth/cubit/transaction_cubit/transaction_states.dart';
import 'package:khadamatic_auth/models/client_orders_model.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TransactionCubit()
      ..getClientOrders(),child:BlocConsumer<TransactionCubit,TransactionStates>(
      listener: (context, state) {

      },
      builder: (context,state){
        if(state is GetTransactionSuccess) {
          return  ListView.separated(itemBuilder: (context, index) {
          return buildClientTransactions(context, TransactionCubit.get
            (context).clientOrdersModel!.data![index]);
        }, separatorBuilder:(context,index)=> const Divider(thickness: 1),
            itemCount: TransactionCubit.get(context).clientOrdersModel!.data!
                .length);
        } else{
          return const Center(child:  CircularProgressIndicator(),);
        }
      },
    ));
  }
  Widget buildClientTransactions(context,DataClientOrders model){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(color: KMainColor,borderRadius:
            const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius
                .circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          const Icon(Icons.link,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text(model.service!.name!,style: Theme.of(context)
                              .textTheme.headline6),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today_outlined,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text(model.date!,style: Theme.of
                            (context)
                              .textTheme.headline6),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.circle,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text(model.service!.name!,style: Theme.of
                            (context)
                              .textTheme.headline6),
                        ],
                      ),
                    ],
                  ),
                  Column(children: [

                     Icon(Icons.check_circle_outline_rounded,color: TransactionCubit.get(context).changeTransactionColor
                      (model)),
                    Text(model.orderType!.type!,style: TextStyle(color: TransactionCubit.get(context).changeTransactionColor
                      (model),fontWeight: FontWeight.bold),),
                    Text(model.total!+' L.E',style: Theme.of(context)
                        .textTheme
                        .headline5!.copyWith(color: Colors.white),),


                  ]),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 5,
            color: TransactionCubit.get(context).changeTransactionColor
              (model),
          ),
        ],
      ),
    );
  }
}
