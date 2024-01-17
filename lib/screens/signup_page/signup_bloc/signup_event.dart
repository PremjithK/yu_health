part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupFormSubmittedEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String gender;
  final DateTime dateOfBirth;
  final double phoneNumber;

  const SignupFormSubmittedEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    required this.phoneNumber,
  });
}

class EmailVerificationRequested extends SignupEvent {}
