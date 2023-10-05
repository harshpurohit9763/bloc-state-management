import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<IncrementEvent>((event, emit) {
      emit(IncrementState(state.counter + 1));
      print('in bloc ${state.counter}');
    });

    on<DecrementEvent>(
      (event, emit) {
        emit(DecrementState(state.counter - 1));
        print(' in bloc ${state.counter}');
      },
    );
  }
}
