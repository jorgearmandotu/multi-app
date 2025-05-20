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

class AuthLoading extends AuthState {
  const AuthLoading(): super (authUser: false);
}

class AuthSuccess extends AuthState {
  User? user;
  AuthSuccess(this.user): super (authUser: true);//usuario token
}

class AuthError extends AuthState {
  final String error;
  const AuthError(this.error): super (authUser: false);
}

class AuthLogoutState extends AuthState {
  const AuthLogoutState(): super (authUser: false);
}
class AuthLogoutErrorState extends AuthState {
  final String error;
  const AuthLogoutErrorState(this.error): super (authUser: false);
}


final class AuthSetState extends AuthState {
   final User user;
   const AuthSetState(this.user) :super(authUser: true, user: user);
}