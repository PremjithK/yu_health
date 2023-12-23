part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserLoading extends AuthEvent{}
class UserLoggedIn extends AuthEvent{}
class UserLoggedOut extends AuthEvent{}