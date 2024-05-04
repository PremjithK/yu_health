import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yu_health/domain/repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupFormSubmittedEvent>(_signupUser);
    on<EmailVerificationRequested>(_verifyEmail);
  }

  FutureOr<void> _signupUser(
    SignupFormSubmittedEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());

    try {
      final userData = await AuthRepository().signup(
        firstName: event.firstName,
        lastName: event.lastName,
        dateOfBirth: event.dateOfBirth,
        gender: event.gender,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
      );
      if (userData != null) {
        await userData.verifyBeforeUpdateEmail(event.email);
        await userData.updateDisplayName(event.firstName);
      }

      emit(SingupComplete());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          emit(
            const SignupFailed(
              title: 'Failed to Sign Up',
              message: 'An account with this email already exists!',
            ),
          );
          break;
        case 'invalid-email':
          emit(
            const SignupFailed(
              title: 'Failed to Sign Up',
              message: 'Email is invalid',
            ),
          );
          break;
        default:
      }
    } catch (err) {
      emit(
        const SignupFailed(
          title: 'Sign Up Failed',
          message: 'An unexpected error occured',
        ),
      );
    }
  }

  FutureOr<void> _verifyEmail(
    EmailVerificationRequested event,
    Emitter<SignupState> emit,
  ) async {
    try {
      await AuthRepository().sendVerificationEmail();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
