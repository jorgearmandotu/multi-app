part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final bool authUser;  //usuario autenticado
  final User? user;

  const AuthState({
    this.authUser = false,
    this.user
  });
}

final class AuthInitialState extends AuthState {
  const AuthInitialState(): super (authUser: false);
}

final class AuthSetState extends AuthState {
   final User newUser;
   const AuthSetState(this.newUser) :super(authUser: true, user: newUser);
}