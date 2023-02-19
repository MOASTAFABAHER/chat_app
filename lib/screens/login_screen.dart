import 'package:chat_app/config/toast_config.dart';
import 'package:chat_app/enums/toast_states.dart';
import 'package:chat_app/screens/chat_item_list.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/login/cubit/login_cubit.dart';
import '../components/custom_botton.dart';
import '../components/custom_textform.dart';
import '../components/my__text.dart';
import '../models/app_colors.dart';
import '../utils/app_navigator.dart';

class LoginScreen extends StatelessWidget {
  String? uIdLogin;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBlack,
        appBar: AppBar(
          backgroundColor: AppColors.kBlack,
          title: Text(
            'Login'.toUpperCase(),
            style: TextStyle(
              color: AppColors.kWhite,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                ToastConfig.showToast(
                    msg: 'Error', toastStates: ToastStates.Error);
              }
              if (state is LoginSuccsessState) {
                print('login $uIdLogin');
                ToastConfig.showToast(
                    msg: 'Wellcome To Chatatak',
                    toastStates: ToastStates.Success);
                AppNavigator.appNavigator(
                    context,
                    ChatItemLsitScreen(
                      uIdLogin: LoginCubit.get(context).uIdLogin,
                    ),
                    isFinished: true);
              }
            },
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              uIdLogin = cubit.uIdLogin;
              print('UID test $uIdLogin');
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      MyText(
                        text: 'Chatatak ',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: MyText(
                          text: 'Name',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextForm(
                          icon: Icon(Icons.email),
                          lable: 'Email',
                          controller: cubit.emailController),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: 'Password',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextForm(
                          isPassword: true,
                          icon: Icon(Icons.password),
                          lable: 'Password',
                          controller: cubit.passwordController),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          MyText(
                            text: 'Don\'t have an Account ? ',
                            fontSize: 14.sp,
                          ),
                          TextButton(
                              onPressed: () {
                                AppNavigator.appNavigator(
                                    context, RegisterScreen(),
                                    isFinished: true);
                              },
                              child: Text('sign up'))
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                          function: () {
                            cubit.login(cubit.emailController.text,
                                cubit.passwordController.text);
                          },
                          weight: double.infinity,
                          hight: 40.h,
                          color: AppColors.kOrange,
                          text: 'Login'),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
