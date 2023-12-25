part of 'auth_state_bloc.dart';

sealed class AuthStateEvent extends Equatable {
  const AuthStateEvent();

  @override
  List<Object> get props => [];
}

class AppLoadingEvent extends AuthStateEvent {}

class AutoLoginEvent extends AuthStateEvent {}

class LogoutEvent extends AuthStateEvent {}
