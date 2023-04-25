part of 'user_state_cubit.dart';

@immutable
abstract class UserStateState {}

class UserStateInitial extends UserStateState {}
class UserTokenLoaded extends UserStateState{
  final String? token;

  UserTokenLoaded(this.token);
}
