part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserState {}

final class CreateUserInitial extends CreateUserState {
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
}

final class CreateUserRequestState extends CreateUserState {
  final String status;
  final CreatedUserDataModel userdata;

  CreateUserRequestState(this.status, this.userdata);
}

final class ResetState extends CreateUserState {}
