import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yu_health/domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginFormSubmittedEvent>(_loginWithEmailAndPassword);
  }

  FutureOr<void> _loginWithEmailAndPassword(
    LoginFormSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    // await Future.delayed(const Duration(milliseconds: 2000));

    final email = event.email;
    final password = event.password;
    final result = await AuthRepository().login(email, password);
    print(result);
    // Error handling
    if (result == 'user-not-found') {
      emit(
        const LoginFailed(
          title: 'Login Failed',
          message: 'This user does not exist',
        ),
      );
    } else if (result == 'wrong-password') {
      emit(
        const LoginFailed(
          title: 'Login Failed',
          message: 'Incorrect password',
        ),
      );
    } else if (result == 'invalid-credential') {
      emit(
        const LoginFailed(
          title: 'Login Failed',
          message: 'Invalid credentials, Please check your email and password',
        ),
      );
    } else if (result == null) {
      emit(LoginSuccess());
    }
  }
}
