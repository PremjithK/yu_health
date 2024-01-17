part of 'profile_card_cubit.dart';

sealed class ProfileCardState extends Equatable {
  const ProfileCardState();

  @override
  List<Object> get props => [];
}

final class ProfileCardInitial extends ProfileCardState {}

final class ProfileCardLoading extends ProfileCardState {}

final class ProfileCardLoaded extends ProfileCardState {
  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth;

  const ProfileCardLoaded({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
  });

  @override
  List<Object> get props => [firstName, lastName, email, dateOfBirth];
}
