import 'package:amazon/bloc/AllItem/all_item_cubit.dart';
import 'package:amazon/models/getCategories.dart';
import 'package:amazon/services/SP/sp_helper.dart';
import 'package:amazon/services/SP/sp_key.dart';
import 'package:amazon/services/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/allItemModel.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());

  static GetCategoriesCubit get(context) => BlocProvider.of(context);
  CategoriesModel? categoriesModel;


  
  getCategories() {
    emit(GetCategoriesLoding());
    DioHelper.getData(
            url: 'categories',
            query: {'category':2},
            token: SharedPreferencesHelper.getData(key: SPkeys.token))
        .then((value) {
      emit(GetCategoriesSuccess());
      print('categories Suc');
      categoriesModel = CategoriesModel.fromJson(value.data);
    }).catchError((e) {
      print('Error categories $e');
      emit(GetCategoriesError());
    });
  }
}
