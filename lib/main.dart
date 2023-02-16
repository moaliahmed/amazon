import 'package:amazon/services/SP/sp_helper.dart';
import 'package:amazon/services/dio_helper.dart';
import 'package:amazon/src/approot.dart';
import 'package:flutter/cupertino.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPreferencesHelper.init();
  runApp(AppRoot());
}