import 'package:bloc/bloc.dart';
import 'package:chat_app/service/local/sp__keys.dart';
import 'package:chat_app/service/local/sp_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? uIdLogin;
  login(String email, String password) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccsessState());
      uIdLogin = FirebaseAuth.instance.currentUser!.uid;
      SharedPrefrenceHelper.saveData(
          key: SharedPreferencesKeys.uId, value: uIdLogin);
      print('cubit $uIdLogin');
    }).catchError((error) {
      emit(LoginErrorState());
      print('Error $error');
    });
  }
}
