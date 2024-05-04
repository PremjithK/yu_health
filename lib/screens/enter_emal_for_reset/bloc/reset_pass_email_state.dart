part of 'reset_pass_email_bloc.dart';

sealed class ResetPassEmailState extends Equatable {
  const ResetPassEmailState();

  @override
  List<Object> get props => [];
}

final class ResetPassEmailInitial extends ResetPassEmailState {}

final class ResetPassEmailLoading extends ResetPassEmailState {}

final class ResetPassEmailError extends ResetPassEmailState {}

final class ResetPassEmailSuccess extends ResetPassEmailState {}
