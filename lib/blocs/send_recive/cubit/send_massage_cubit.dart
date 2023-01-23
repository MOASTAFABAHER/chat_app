import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/massage_model.dart';

part 'send_massage_state.dart';

class SendMassageCubit extends Cubit<SendMassageState> {
  SendMassageCubit() : super(SendMassageInitial());
  TextEditingController massageController = TextEditingController();
  static SendMassageCubit get(context) => BlocProvider.of(context);
  void sendMassege({
    required String reciverId,
    required String dateTime,
    required String text,
    required String senderUId,
  }) {
    MassageModel massageModel = MassageModel(
        text: text,
        senderId: senderUId,
        reciverId: reciverId,
        dateTime: dateTime);
    FirebaseFirestore.instance
        .collection('users')
        .doc(senderUId)
        .collection('chat')
        .doc(reciverId)
        .collection('massages')
        .add(massageModel.toMap())
        .then((value) {
      emit(SendMassgageSuccsessState());
    }).catchError((error) {
      print('Error $error');
      emit(SendMassageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverId)
        .collection('chat')
        .doc(senderUId)
        .collection('massages')
        .add(massageModel.toMap())
        .then((value) {
      emit(SendMassgageSuccsessState());
    }).catchError((error) {
      print('Error $error');
      emit(SendMassageErrorState());
    });
  }

  List<MassageModel> massagesList = [];
  getMassages({required String? senderId, required String? reciverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('chat')
        .doc(reciverId)
        .collection('massages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      massagesList = [];
      event.docs.forEach((element) {
        massagesList.add(MassageModel.fromJson(element.data()));
      });
      emit(GetMassageSuccsessState());
    });
  }
}
