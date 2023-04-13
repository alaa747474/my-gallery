part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class UserLogedInSuccessfully extends AuthState {
  final LoginModel loginModel;

  UserLogedInSuccessfully(this.loginModel);
}
class UserFaildToLogIn extends AuthState {}
