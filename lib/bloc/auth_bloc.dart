import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multisuministros/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<LoginUser>((event, emit) {
      // TODO: implement event handler
    });
  }
}
