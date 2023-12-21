import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginFormSubmittedEvent>(_loginWithEmailAndPassword);
  }

  FutureOr<void> _loginWithEmailAndPassword(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginLoading());
    Future.delayed(Durations.long3);
    if (event is LoginFormSubmittedEvent) {
      final email = event.email;
      final password = event.password;
      if (email == 'johnwick@gmail.com' && password == 'john123') {
        emit(LoginSuccess());
      } else {
        emit(
          const LoginFailed(
            title: 'Login Failed',
            message: 'Invalid Email Or Password',
          ),
        );
      }
    }
  }
}
