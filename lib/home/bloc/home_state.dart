part of 'home_bloc.dart';

abstract class HomeState {
  final int counter;

  HomeState({required this.counter});
}

class HomeInitial extends HomeState {
  HomeInitial() : super(counter: 0);
}

class IncrementState extends HomeState {
  IncrementState(int increasedCounter) : super(counter: increasedCounter);
}

class DecrementState extends HomeState {
  DecrementState(int decreasedCounter) : super(counter: decreasedCounter);
}
