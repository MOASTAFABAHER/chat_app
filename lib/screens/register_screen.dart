import 'package:chat_app/blocs/register/cubit/register_cubit.dart';
import 'package:chat_app/components/custom_botton.dart';
import 'package:chat_app/components/custom_textform.dart';
import 'package:chat_app/components/my__text.dart';
import 'package:chat_app/config/toast_config.dart';
import 'package:chat_app/enums/toast_states.dart';
import 'package:chat_app/models/app_colors.dart';
import 'package:chat_app/screens/chat_item_list.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  String? uId;
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: AppColors.kBlack,
        appBar: AppBar(
          backgroundColor: AppColors.kBlack,
          title: Text(
            'Sign up'.toUpperCase(),
            style: TextStyle(
              color: AppColors.kWhite,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is CreateuserSuccses) {
                print('Function $uId');
                ToastConfig.showToast(
                    msg: 'Wellcome TO Chatatak App ',
                    toastStates: ToastStates.Success);
                AppNavigator.appNavigator(
                    context,
                    ChatItemLsitScreen(
                      uId: uId!,
                    ),
                    isFinished: true);
              }
              ;
              if (state is RegisterErrorState) {
                ToastConfig.showToast(
                    msg: 'Error', toastStates: ToastStates.Error);
              }
              ;
            },
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              uId = cubit.uId;

              return SingleChildScrollView(
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
                        lable: 'passwrod',
                        controller: cubit.passwordController),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        MyText(
                          text: 'Already have An Account ?',
                          fontSize: 14.sp,
                        ),
                        TextButton(
                            onPressed: () {
                              AppNavigator.appNavigator(context, LoginScreen(),
                                  isFinished: true);
                            },
                            child: Text('login'))
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        function: () {
                          cubit.userRegsiter(cubit.emailController.text,
                              cubit.passwordController.text);
                          if (state is CreateuserSuccses) {
                            AppNavigator.appNavigator(
                                context,
                                ChatItemLsitScreen(
                                  uId: cubit.uId,
                                ),
                                isFinished: true);
                          }
                        },
                        weight: double.infinity,
                        hight: 40.h,
                        color: AppColors.kOrange,
                        text: 'Create  an Account'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
