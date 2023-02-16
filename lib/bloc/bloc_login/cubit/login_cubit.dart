import 'package:amazon/models/Authentication.dart';
import 'package:amazon/services/SP/sp_key.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:amazon/services/SP/sp_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
Authentication? authentication;

  login() {
    emit(LoginLoadingState());
    DioHelper.postData(url: 'login', data: {
      'email': emailController.text,
      'password': passwordController.text,
    }).then((value) {
       print('suc');
      emit(LoginSuccessState());
      authentication=Authentication.fromJson(value.data);
      SharedPreferencesHelper.saveData(key: SPkeys.token, value: authentication!.data!.accessToken);
      print(authentication!.data!.accessToken); 
      }).catchError((e) {
      print(e);
      emit(LoginErrorState());
      print(emailController.text);
      print(passwordController.text);
    });
  }
}
