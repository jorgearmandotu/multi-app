part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final bool authUser;
  final User? user;

  const AuthState({
    this.authUser = false,
    this.user
  });
}

final class AuthInitial extends AuthState {
  const AuthInitial(): super (authUser: false);
}

final class AuthSetState extends AuthState {
  // final User newUser;
}