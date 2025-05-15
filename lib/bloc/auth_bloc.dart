import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multisuministros/models/user.dart';
import 'package:multisuministros/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {

    final authService = AuthService();
    on
    <LoginUser>((event, emit) {
      authService.login(event.user.email, event.user.password).then((value) {
        if (value) {
          print(value);
          emit(AuthSetState(event.user));
        } else {
          emit(AuthInitialState());
        }
      });
      //emit(AuthSetState(event.user));
    });
  }
}
