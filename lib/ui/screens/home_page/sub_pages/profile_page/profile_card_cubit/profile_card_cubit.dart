import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'profile_card_state.dart';

class ProfileCardCubit extends Cubit<ProfileCardState> {
  ProfileCardCubit() : super(ProfileCardInitial());

  Future<void> getProfile(String id) async {
    emit(ProfileCardLoading());
    try {
      final res =
          await FirebaseFirestore.instance.collection('users').doc(id).get();

      final String firstName = res['firstName'];
      final String lastName = res['lastName'];
      final String email = res['email'];
      final String dateOfBirth =
          (res['dateOfBirth'] as Timestamp).toDate().toString();
      emit(ProfileCardLoaded(
        firstName: firstName,
        lastName: lastName,
        email: email,
        dateOfBirth: dateOfBirth,
      ));
    } catch (e) {}
  }
}
