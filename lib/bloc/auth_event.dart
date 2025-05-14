part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginUser extends AuthEvent { //activate
  final User user;
  LoginUser(this.user);
}

//class change user, add dataa user, logout