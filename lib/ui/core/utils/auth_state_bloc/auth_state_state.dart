part of 'auth_state_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AppLoading extends AuthState {}

final class UserLoggedIn extends AuthState {}

final class UserLoggedOut extends AuthState {}
