// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_user_bloc.dart';

@immutable
sealed class CreateUserEvent {}

class CreateUserRequestEvent extends CreateUserEvent {
  final String name, password;
  CreateUserRequestEvent({required this.password, required this.name});
}

final class ResetEvent extends CreateUserEvent {}
