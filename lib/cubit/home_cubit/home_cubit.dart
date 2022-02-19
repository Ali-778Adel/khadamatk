import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khadamatic_auth/models/best_tech_model.dart';
import 'package:khadamatic_auth/models/categories_model.dart';
import 'package:khadamatic_auth/models/sub_categoy_model.dart';
import 'package:khadamatic_auth/networks/authentication_dio_helper.dart';

import '../../constants/endpoints.dart';
import '../../sharedpref/sharedpref.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialState());

 static HomeCubit get(context)=> BlocProvider.of(context);
  late String token =  SharedPref_Helper.getDataFromShareprefrences(key: 'token');
  String staticToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9'
      '.eyJhdWQiOiIxIiwianRpIjoiNmUzOTc3OTY0ZWNlMjc2ZjBlNjY5NGIzYjJjYjRmZjU5NWExNTBlZWMwMTMxZTQ2YjdlMzQ2MDlmNDMwZWY5NDRjNmUyODA3NGY4NGUxOGEiLCJpYXQiOjE2NDUxMjg2OTEsIm5iZiI6MTY0NTEyODY5MSwiZXhwIjoxNjc2NjY0NjkxLCJzdWIiOiIzOCIsInNjb3BlcyI6W119.qn3diurUr3wOIs0gM-KG-LmqhTMQ7Sae4zMEE6v1UpDdtC-LxyDQbZ8Y8O0SLtdKwT7mYc5tUF1cmCutVulep3zy8kA8KgeaIF4J0ND4fcvyo0dwNskP_hm8eqRYuuYBTI4IcHmx4fp38TLZpEH6AVaZ9rHXDwHZnzULCxEzEVoBoR46oxHP2WWZ48tiuB6a_miJaOqWGN6Ugx0kWDL_WP8CzkBuBY4LRi7Bb8d49s39-DXRG_0tOi42xTd7UqU8l8bnTpFqM6bjAcNUcwxAOgPL6scHmYYFQQmBVm34P8FrQ1f1O-5CbHIiMFQtYkrjVsiSC8FH_GYN9UXWdEbwO_978F72-To2bkYKUTKkVzVj4KfBQZO0Hh6InSJJ9dRgpZj3KC2cLTZ2E7jQhSPD5nnCwuL-tEddZe49WVpKu1xttC2AEoDfXBLPFZ4V1-FkPi8prExJ6bmC4JuGwRJxgpEIlbDsi2YZklOkMnDqNunzF4yq5Byy8VOSVvhfoFHURdm_-b0yEJRWsnfMN29XkyZA1ci6Blbmxql-X7JY9RE06jJZLIPG1S_uYW_mXndO4hJLSsrP5uP5uQwF-LvqH8CA7dciSrxHn9ZMy9g9J2mukLBbuCXAwQ47BTleWt2_dS6qZe9JihjbR4HyFv5LRmgCCFuo6Ge5q26s82B_okU';
CategoriesModel? categoriesModel;
void getCategories(){
  emit(GetCategoriesLoading());
  AuthenticationDioHelper.dio!.get(categories,options: Options(headers:
  {'Accept':'application/json','Authorization':'Bearer $token'}),
  ).then(
          (value) {
           // print(value.data);
            categoriesModel = CategoriesModel.fromJson(value.data);
            print(categoriesModel);
            emit(GetCategoriesSuccess(categoriesModel!));
          }).catchError(
          (error){
            print(error.toString());
            emit(GetCategoriesError());
          });
}
BestTechModel? bestTechModel;
void getBestTech(){
  emit(GetBestTechLoading());
  AuthenticationDioHelper.dio!.get(bestTech,options: Options(headers:
  {'Accept':'application/json','Authorization':'Bearer $token'}),).then(
          (value) {
          //  print(value.data);
            bestTechModel = BestTechModel.fromJson(value.data);
            print(bestTechModel);
            emit(GetBestTechSuccess(bestTechModel!));
          }).catchError((error){
            print(error.toString());
            emit(GetBestTechError());
  });
}

// void getTechnicalProfile(){
//   AuthenticationDioHelper.dio!.get('/technical-profile/3',options: Options
//     (headers: {'Accept':'application/json','Authorization':'Bearer '
//       'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDhkZGYyZDFmNDQwZTg1NzUwOWFjMTdjNTAwODRmNGQwYzIwYmNiN2VkMDhkNmJlODc1ODdkMjMwMWQwYzdiZDA5MzAwNjA0MWJjMzZjY2MiLCJpYXQiOjE2NDUyODQ3NzUsIm5iZiI6MTY0NTI4NDc3NSwiZXhwIjoxNjc2ODIwNzc1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.jQNde2yKl3oxASdQ2ht34UfNAPUHMdmjkFRC3dnWtvbvp2Vbbny1g-3An9OmMwPD4b_z4kgm3lse0t42uj-u2lFt4Ze5z8EgZezgmiumlYgGeO605CTa8eBgJfSOBHrMFhTHY4BHTq0oLFIXmVf--S3JPLUsO3cKJZ1gfwbOyLtSieDrr5bcVTpWLQuKeMhzeHcdGK0xzrmlrZi11aiF51NUwcnft7fxT_dSd8y0DkNwqgtkXXDpEaCmbfjdwQqJt5tEilYF01tur2jz6LLF7vo3sdwdOs8-_f7Fa916n_IqfVrdEMJVH5ylqCxeRyPgEPIxSEP5SiHWl09M3u6G52Q2CLtvjsy36g7CRrCfRpTtdkJb0M3vnfgsdj5iG7PyOx4Cuez3UHw-hUaI6f2b9HKM1co8etmEk_2hnUhNOZyMblB9SU5ZlJBcb8tO_Ndz_SjKurKfMOuOifwk6Vb6joQZIEINiGePCDflVQ_dOUx9HERGPrNPNe1-S2--cw78PDj2SEV3iBYQD4rwN2UfXRMkNAww0mx89Ctup2u0jfUF_5_fZM-m0M9NM8v_qTrLwwI42He5VFLsgHaGTHssXObxJdyp_xjouuji3Tx66bX_eI1P-XUsCl72YVch0X_5cRsIiHGLd_Uz-eFgKHuUFiM5S1jPfaS-8SSfd-wLkaM'})).then((value) {
//         print(value.data);
//   });
// }

SubCategoryModel? subCategoryModel;
Future<SubCategoryModel?> getSubCategory({required int categoryNum})async {
  emit(GetSubCategoryLoading());
  print(categoryNum);
  AuthenticationDioHelper.dio!.get(subCategory+categoryNum.toString(),).then((value) {
    print(value.data);
    subCategoryModel = SubCategoryModel.fromJson(value.data);

    emit(GetSubCategorySuccess(subCategoryModel!));
    return subCategoryModel;
  }).catchError((error){
    print(error.toString());

    emit(GetSubCategoryError());
  });
  return null;

  }
}