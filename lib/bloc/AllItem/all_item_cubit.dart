import 'package:amazon/models/allItemModel.dart';
import 'package:amazon/services/SP/sp_helper.dart';
import 'package:amazon/services/SP/sp_key.dart';
import 'package:amazon/services/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_item_state.dart';

class AllItemCubit extends Cubit<AllItemState> {
  AllItemCubit() : super(AllItemInitial());
  AllItemModel? allItemModel;

  getAllItem() {
    emit(AllItemLoding());
    DioHelper.getData(
            url: 'products',
            token: SharedPreferencesHelper.getData(key: SPkeys.token))
        .then((value) {
          emit(AllItemSueccess());
          allItemModel=AllItemModel.fromJson(value.data);
          print('allItem Suc');
        })
        .catchError((e) {
          print('AllItem Erro $e');
          emit(AllItemError());
        });
  }
}
