import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        print('Auth state changed');
        add(user != null ? UserLoggedIn() : UserLoggedOut());
      },
    );

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
