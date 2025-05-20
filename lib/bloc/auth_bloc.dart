import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multisuministros/models/user.dart';
import 'package:multisuministros/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {

    final authService = AuthService();

    Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, 
      Emitter<AuthState> emit) async {
        emit(AuthLoading());
        try {
          final user = await authService.login(event.email, event.password);
          if (user != null) {
            emit(AuthSuccess(user));
          } else {
            emit(AuthError('Error de autenticacion'));
          }
        } catch (e) {
          emit(AuthError(e.toString()));
       }
    }
    
    on<LoginUser>((event, emit) {
      authService.login(event.user.email, event.user.password).then((value) {
        if (value != null ) {
          print(value);
          emit(AuthSetState(event.user));
        } else {
          emit(AuthInitialState());
        }
      });
      //emit(AuthSetState(event.user));
    });

    on<LoginButtonPressed>(_onLoginButtonPressed);

    


  }
}
