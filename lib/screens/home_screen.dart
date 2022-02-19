import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/constants/constants.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_cubit.dart';
import 'package:khadamatic_auth/cubit/home_cubit/home_states.dart';
import 'package:khadamatic_auth/models/best_tech_model.dart';
import 'package:khadamatic_auth/models/categories_model.dart';
import 'package:khadamatic_auth/screens/sub_category_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  String link =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxiJQBK4qrR_l2f3OHLP0IdXggEoOH-3OVgQ&usqp=CAU';
  Widget ratingIcon = Icon(
    Icons.star,
    color: Colors.amber,
    size: 15,
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getCategories()
        ..getBestTech(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (cubit.bestTechModel != null && cubit.categoriesModel != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Banners',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: KMainColor),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Text('Five Stars Rate',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: KMainColor)),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildBestTech(
                                context, cubit.bestTechModel!.data![index]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: cubit.bestTechModel!.data!.length),
                    ),
                    Text('Category',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: KMainColor)),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return buildCategories(
                                context, cubit.categoriesModel!.data![index]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: cubit.categoriesModel!.data!.length),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildBestTech(context, Data model) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(model.image == null ||
                          model.image?.startsWith('public') == true
                      ? link
                      : model.image!),
                  fit: BoxFit.contain),
              border: Border.all(color: KMainColor, width: 2),
              borderRadius: BorderRadius.circular(50)),
          width: 100,
          height: 120,
          // child: Image(image: NetworkImage(link),fit: BoxFit.fitWidth,),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          model.name!,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: KMainColor),
        ),
        Text(
          model.userService == null || model.userService!.subCategory == null
              ? 'سباكة.'
              : model.userService!.subCategory!.nameAr!,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(color: KJobColor),
        ),
        Row(
          children: List.generate(5, (index) => ratingIcon),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Order Now', style: TextStyle(color: KMainColor)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1, color: KMainColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ],
    );
  }

  List<Data> data = [];
  Widget buildCategories(context, DataCat model) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return InkWell(
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                SubCategoryScreen(categoryName: model.name!, id: model.id!),));



            // await HomeCubit.get(context)
            //     .getSubCategory(categoryNum: model.id)
            //     .then((value) async {
              // if(state is GetSubCategorySuccess) {
            //   await Navigator.push(context,
            //       MaterialPageRoute(builder: (context) {
            //         if(state is GetSubCategorySuccess) {
            //           return SubCategoryScreen(
            //       categoryName: model.name!,
            //             id: model.id,
            //     );
            //         // }
            //         // else{
            //         //   return Scaffold(body: Center(child: CircularProgressIndicator()));
            //         // }
            //   }));
            // });
          },
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: KMainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Icon(Icons.link, size: 80, color: Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(model.name!,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: KMainColor)),
            ],
          ),
        );
      },
    );
  }
}
