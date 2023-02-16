import 'package:amazon/bloc/AllItem/all_item_cubit.dart';
import 'package:amazon/bloc/bloc_login/cubit/login_cubit.dart';
import 'package:amazon/bloc/bloc_signup/cubit/sign_up_cubit.dart';
import 'package:amazon/bloc/get_categories/get_categories_cubit.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/screens/login_screan.dart';
import 'package:amazon/screens/onBordingScrean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetCategoriesCubit(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => SignUpCubit(),
              child: Container(),
            )
            ,
            BlocProvider(
              create: (context) => AllItemCubit(),
              child: Container(),
            )
          ],
          child:  MaterialApp(
          home: LoginScrean(),
        ),
        );
      },
    );
  }
}
