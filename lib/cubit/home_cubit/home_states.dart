import 'package:khadamatic_auth/models/best_tech_model.dart';
import 'package:khadamatic_auth/models/categories_model.dart';

import '../../models/sub_categoy_model.dart';

abstract class HomeStates {}
class HomeInitialState extends HomeStates{}
class GetCategoriesSuccess extends HomeStates{
  final CategoriesModel categoriesModel;

  GetCategoriesSuccess(this.categoriesModel);
}
class GetCategoriesError extends HomeStates{}
class GetCategoriesLoading extends HomeStates{}

class GetBestTechSuccess extends HomeStates {
  final BestTechModel bestTechModel;

  GetBestTechSuccess(this.bestTechModel);
}
class GetBestTechError extends HomeStates{}
class GetBestTechLoading extends HomeStates{}



class GetSubCategorySuccess extends HomeStates {
  final SubCategoryModel subCategoryModel;

  GetSubCategorySuccess(this.subCategoryModel);
}
class GetSubCategoryError extends HomeStates{}
class GetSubCategoryLoading extends HomeStates{}
