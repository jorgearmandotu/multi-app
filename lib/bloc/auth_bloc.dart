import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multisuministros/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {

    on<LoginUser>((event, emit) {
      emit(AuthSetState(event.user));
    });
  }
}
