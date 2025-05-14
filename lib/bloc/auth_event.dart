part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginUser extends AuthEvent { //activate
  final User user;
  LoginUser(this.user);
}

