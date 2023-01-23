part of 'get_all_users_cubit.dart';

@immutable
abstract class GetAllUsersState {}

class GetAllUsersInitial extends GetAllUsersState {}
class GetAllUsersLoadingState extends GetAllUsersState {}
class GetAllUsersSuccsessState extends GetAllUsersState {}
class GetAllUsersErrorState extends GetAllUsersState {}

