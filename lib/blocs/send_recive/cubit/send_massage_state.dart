part of 'send_massage_cubit.dart';

@immutable
abstract class SendMassageState {}

class SendMassageInitial extends SendMassageState {}

class SendMassgageSuccsessState extends SendMassageState {}

class SendMassageErrorState extends SendMassageState {}

class GetMassageSuccsessState extends SendMassageState {}
