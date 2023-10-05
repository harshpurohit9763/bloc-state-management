part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class FetchDataEvent extends ApiEvent {}

class SuccessDataFetchEvent extends ApiEvent {}
