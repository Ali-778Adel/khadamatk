import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_cubit.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_states.dart';
import 'package:khadamatic_auth/models/sub_categoy_model.dart';

import '../constants/constants.dart';

class SubCategoryScreen extends StatelessWidget {
   SubCategoryScreen({Key? key, required this.categoryName, required this.id,  }) : super(key: key);

   final String categoryName;
  // final List<Data> data;
   final int id ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) =>  HomeCubit()..getSubCategory(categoryNum: id),
      child: BlocConsumer<HomeCubit,HomeStates>(listener: (context, state) {


      },builder: (context,state){
        if(state is GetSubCategorySuccess) {
          return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(categoryName,
                  style:
                  Theme.of
                  (context)
                  .textTheme.headline6!.copyWith(color:
              KMainColor)),
                  SizedBox(height: 20,),
                  if(state.subCategoryModel.data!.isNotEmpty)
                  GridView.count(shrinkWrap: true,crossAxisCount: 3,children: List
                      .generate(state.subCategoryModel.data!.length,
                          (index) => Column(
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: KMainColor,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  Icon(Icons.link,size: 80,color: Colors.white),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Text(state.subCategoryModel.data![index].name!,
                                    style:
                                Theme.of
                                  (context)
                                    .textTheme.headline6!.copyWith(color:
                                KMainColor)),
                              ),
                            ],
                          )),),
                  if(state.subCategoryModel.data!.isEmpty)
                    Center(child: Text('There is no Sub Categories here ...')),
                ],
              ),
            ),
          ),
        );
        }
        else{
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },),
    );
  }
}
