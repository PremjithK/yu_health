import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:yu_health/domain/repositories/auth_repository.dart';

part 'reset_pass_email_event.dart';
part 'reset_pass_email_state.dart';

class ResetPassEmailBloc
    extends Bloc<ResetPassEmailEvent, ResetPassEmailState> {
  ResetPassEmailBloc() : super(ResetPassEmailInitial()) {
    on<ResetPassEmailSubmitted>(_resetPassEmailSubmitted);
  }

  FutureOr<void> _resetPassEmailSubmitted(
    ResetPassEmailSubmitted event,
    Emitter<ResetPassEmailState> emit,
  ) async {
    emit(ResetPassEmailLoading());
    try {
      await AuthRepository().sendResetPasswordEmail(event.email);
      emit(ResetPassEmailSuccess());
    } on FirebaseException catch (e) {
      log(e.message.toString());
      emit(ResetPassEmailError());
    }
  }
}
