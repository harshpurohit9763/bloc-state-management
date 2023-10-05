part of 'media_bloc.dart';

@immutable
abstract class MediaEvent {}

class FetchUsersEvent extends MediaEvent {}

class UpdateCounterEvent extends MediaEvent {}

class ClearCounterEvent extends MediaEvent {}

class CreateUserEvent extends MediaEvent {}
