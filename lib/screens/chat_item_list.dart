import 'package:chat_app/blocs/get_all_users/cubit/get_all_users_cubit.dart';
import 'package:chat_app/components/chat_item.dart';
import 'package:chat_app/models/app_colors.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItemLsitScreen extends StatelessWidget {
  String? uId;
  String? uIdLogin;
  ChatItemLsitScreen({this.uId, this.uIdLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlack,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AppNavigator.appNavigator(context, RegisterScreen(),
                    isFinished: true);
              },
              icon: Icon(Icons.logout)),
        ],
        backgroundColor: AppColors.kBlack,
        title: Text(
          'Chattatak'.toUpperCase(),
          style: TextStyle(color: AppColors.kWhite),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) =>
            GetAllUsersCubit()..getAllUseres(uId: uId, uIdlogin: uIdLogin),
        child: BlocConsumer<GetAllUsersCubit, GetAllUsersState>(
          listener: (context, state) {
            if (state is GetAllUsersLoadingState) {
              Center(child: CircularProgressIndicator());
            }
          },
          builder: (context, state) {
            var cubit = GetAllUsersCubit.get(context);
            return cubit.userslist?.length != null
                ? ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatItem(
                        registerUId: uId,
                        senderUId: uIdLogin,
                        reciverUId: cubit.userslist?[index].uId,
                        email: cubit.userslist?[index].email ?? '',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemCount: cubit.userslist?.length ?? 0)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
