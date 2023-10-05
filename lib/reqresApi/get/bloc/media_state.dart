part of 'media_bloc.dart';

@immutable
sealed class MediaState {}

final class MediaInitial extends MediaState {}

class FetchUsersState extends MediaState {
  final List<Datum> user;
  int counter = 1;
  FetchUsersState(this.user, this.counter);
}

class ClearCounterState extends MediaState {
  void navigateBack(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReqResScreen(),
        ));
  }
}

class CreateUserState extends MediaState {}
