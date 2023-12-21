part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}



class LoginFormSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginFormSubmittedEvent({
    required this.email,
    required this.password,
  });
}
