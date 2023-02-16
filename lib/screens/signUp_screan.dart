import 'package:amazon/bloc/bloc_signup/cubit/sign_up_cubit.dart';
import 'package:amazon/component/botton_component.dart';
import 'package:amazon/screens/login_screan.dart';
import 'package:amazon/src/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScrean extends StatelessWidget {
  const SignUpScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SignUpCubit,SignUpState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit= SignUpCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(height: 30.h),
                  Image.asset('assets/app_icon/logo.png'),
                   Text(
                    'Welcome to portatile',
                    style: TextStyle(
                        color: Color(0xff214eff),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height: 12.h),
                   Text(
                    'Please sign up to join us',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                   SizedBox(height: 12.h),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: UnderlineInputBorder(),
                        labelText: ' full name',
                      ),
                      controller: cubit.nameController,
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_rounded),
                        border: UnderlineInputBorder(),
                        labelText: ' your email',
                      ),
                      controller: cubit.emailController,
                    ),
                  ),
                  Padding(
                    padding:
                         EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: UnderlineInputBorder(),
                        labelText: ' your password',
                      ),
                      controller: cubit.passwordController,
                    ),
                  ),
                   SizedBox(height: 12.h),
                  Button(name: 'Continue', function: () { cubit.signUP(); }),
                   SizedBox(height: 22.h),
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
                          child:
                              Image.asset("assets/social_media_logo/twitter.png"),
                        ),
                      ),
                       SizedBox(width: 30.w),
                      CircleAvatar(
                        radius: (12.r),
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90.r),
                          child:
                              Image.asset("assets/social_media_logo/google.png"),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 12.h),
                   Text(
                    'Already have an account ?',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                   SizedBox(height: 12.h),
                  Button(
                      name: 'Login',
                      function: () {
                        AppNavigator.appNavigator(context, true, LoginScrean());
                      })
                ],
              ),
            );
          },
        ));
  }
}
