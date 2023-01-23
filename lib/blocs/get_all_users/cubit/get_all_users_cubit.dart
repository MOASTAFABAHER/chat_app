import 'package:bloc/bloc.dart';
import 'package:chat_app/models/massage_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit() : super(GetAllUsersInitial());
  static GetAllUsersCubit get(context) => BlocProvider.of(context);

  List<UserModel>? userslist = [];
  String? uId;
  String? uIdlogin;
  String? myId;
  getAllUseres({required uId, required uIdlogin}) {
    this.uIdlogin = uIdlogin;
    this.uId = uId;
    emit(GetAllUsersLoadingState());
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] == uId || element.data()['uId'] == uIdlogin) {
          print('empty');
        } else {
          userslist?.add(UserModel.fromJson(element.data()));
        }
      });
      emit(GetAllUsersSuccsessState());
    }).catchError((error) {
      emit(GetAllUsersErrorState());
      print('get Error:${error.toString()}');
    });
  }
}
