part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;
  LoginButtonPressed(this.email, this.password);
}

class LoginUser extends AuthEvent { //activate
  final User user;
  LoginUser(this.user);
}

//class change user, add dataa user, logout