import 'package:amazon/bloc/bloc_login/cubit/login_cubit.dart';
import 'package:amazon/bloc/bloc_signup/cubit/sign_up_cubit.dart';
import 'package:amazon/component/botton_component.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/screens/signUp_screan.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            AppNavigator.appNavigator(context, true, HomeScrean());
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                   SizedBox(height: 40.h),
                  Image.asset('assets/app_icon/logo.png'),
                   Text(
                    'Welcome back',
                    style: TextStyle(
                        color: Color(0xff214eff),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 12.h),
                   Text(
                    'Please login to your account',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                 SizedBox(height: 12.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 8.h, vertical: 16.w),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: UnderlineInputBorder(),
                        labelText: ' your email',
                      ),
                      controller: cubit.emailController,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 8.r, vertical: 16.r),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_rounded),
                        border: UnderlineInputBorder(),
                        labelText: ' your password',
                      ),
                      controller: cubit.passwordController,
                    ),
                  ),
                   SizedBox(height: 22.h),
                  Button(name: 'Continue', function: () {cubit.login();}),
                   SizedBox(height: 52.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: (16.r),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90.r),
                          child: Image.asset(
                              "assets/social_media_logo/facebook.png"),
                        ),
                      ),
                       SizedBox(width: 30.w),
                      CircleAvatar(
                        radius: (16.r),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90.r),
                          child: Image.asset(
                              "assets/social_media_logo/twitter.png"),
                        ),
                      ),
                       SizedBox(width: 30.w),
                      CircleAvatar(
                        radius: (12.r),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90.r),
                          child: Image.asset(
                              "assets/social_media_logo/google.png"),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 22.h),
                   Text(
                    "Don't have account ?",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                   SizedBox(height: 12.h),
                  Button(
                      name: 'Sign Up',
                      function: () {
                        AppNavigator.appNavigator(
                            context, true,const SignUpScrean());
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}