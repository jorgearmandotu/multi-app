part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginUser extends AuthEvent {
  final User user;
  LoginUser(this.user);
}