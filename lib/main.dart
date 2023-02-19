import 'package:chat_app/service/local/sp_helper.dart';
import 'package:chat_app/src/app_root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();

  await Firebase.initializeApp();
  runApp(const AppRoot());
}
