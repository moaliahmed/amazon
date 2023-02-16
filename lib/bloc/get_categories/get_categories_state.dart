part of 'get_categories_cubit.dart';

@immutable
abstract class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}



class GetCategoriesSuccess extends GetCategoriesState {}
class GetCategoriesLoding extends GetCategoriesState {}
class GetCategoriesError extends GetCategoriesState {}
