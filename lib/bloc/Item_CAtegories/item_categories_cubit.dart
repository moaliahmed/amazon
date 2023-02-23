import 'package:amazon/services/SP/sp_helper.dart';
import 'package:amazon/services/SP/sp_key.dart';
import 'package:amazon/services/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/item_categories.dart';

part 'item_categories_state.dart';

class ItemCategoriesCubit extends Cubit<ItemCategoriesState> {
  ItemCategoriesCubit() : super(ItemCategoriesInitial());

  static ItemCategoriesCubit get(context)=>BlocProvider.of(context);

  int? numberCategories;
ItemCategories? itemcategories;
  getItem({ int? number} ) {
    emit(ItemCategoriesLoding());
    DioHelper.getData(
        url: 'product',
        token: SharedPreferencesHelper.getData(key: SPkeys.token),
        query: {'category': number}).then((value) {
          emit(ItemCategoriesSuccess());
          itemcategories=ItemCategories.fromJson(value.data);
            print('${itemcategories?.data}');
        }).catchError((e) {
          emit(ItemCategoriesError());
          print('Item Categories $e');
        });
  }
}
