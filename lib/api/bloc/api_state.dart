part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiFetchedState extends ApiState {
  final List<Product> productList;

  ApiFetchedState(this.productList);
}
