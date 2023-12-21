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
    LoginFormSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(milliseconds: 2000));

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
