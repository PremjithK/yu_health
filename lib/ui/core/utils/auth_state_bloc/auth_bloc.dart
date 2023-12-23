import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      if (event is UserLoading) {
        emit(AuthLoading());
      }
      if (event is UserLoggedOut) {
        emit(AuthLoggedOut());
      }
      if (event is UserLoggedIn) {
        emit(AuthLoggedIn());
      }
    });
  }
}
