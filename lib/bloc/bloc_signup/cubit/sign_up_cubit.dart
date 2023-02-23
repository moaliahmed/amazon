import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/SignUp.dart';
import 'package:amazon/services/SP/sp_helper.dart';

import '../../../models/error_signUp.dart';
import '../../../services/dio_helper.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  ErrorSignUp? errorSignUp; 
  SignUp? signUp;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  signUP() {
    emit(SignUpLoding());
    DioHelper.postData(
      url: 'register',
      data: {
        'name': nameController.text,
        'email':emailController.text,
        'password':passwordController.text
      },
    )
        .then(
          (value) {
            emit(SignUpSuccess());
            print('suc');
            signUp=SignUp.fromJson(value.data);
            print(signUp!.data!.accessToken);
          },
        )
        .catchError(
          ( error) {
           // emit(SignUpError());
            print(error.response);

          //  errorSignUp=ErrorSignUp.fromJson(error.response);
          //    print(errorSignUp);
          },
        );
  }
}
                                                                                 