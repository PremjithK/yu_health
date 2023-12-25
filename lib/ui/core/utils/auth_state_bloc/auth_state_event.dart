part of 'auth_state_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoadingEvent extends AuthEvent {}

class AutoLoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
