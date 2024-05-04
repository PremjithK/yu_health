part of 'reset_pass_email_bloc.dart';

sealed class ResetPassEmailEvent extends Equatable {
  const ResetPassEmailEvent();

  @override
  List<Object> get props => [];
}

class ResetPassEmailSubmitted extends ResetPassEmailEvent {
  final String email;

  const ResetPassEmailSubmitted(this.email);
}
