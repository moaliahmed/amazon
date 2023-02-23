part of 'item_categories_cubit.dart';

@immutable
abstract class ItemCategoriesState {}

class ItemCategoriesInitial extends ItemCategoriesState {}



class ItemCategoriesSuccess extends ItemCategoriesState {}
class ItemCategoriesError extends ItemCategoriesState {}
class ItemCategoriesLoding extends ItemCategoriesState {}
