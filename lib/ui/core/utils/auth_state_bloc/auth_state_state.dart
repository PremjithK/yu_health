part of 'auth_state_bloc.dart';

sealed class AuthStateState extends Equatable {
  const AuthStateState();

  @override
  List<Object> get props => [];
}

final class AppLoading extends AuthStateState {}

final class UserLoggedIn extends AuthStateState {}

final class UserLoggedOut extends AuthStateState {}
