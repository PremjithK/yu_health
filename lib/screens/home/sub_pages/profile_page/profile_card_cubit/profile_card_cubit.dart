import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:yu_health/data/constants.dart';
import 'package:yu_health/core/utils/date_utils.dart';

part 'profile_card_state.dart';

class ProfileCardCubit extends Cubit<ProfileCardState> {
  ProfileCardCubit() : super(ProfileCardInitial());

  Future<void> getProfile(String docId) async {
    emit(ProfileCardLoading());
    try {
      // [docID] in this case is the current user's UID
      final res = await FirebaseFirestore.instance
          .collection(CollectionNames.users)
          .doc(docId)
          .get();

      final DateTime dob = (res['dateOfBirth'] as Timestamp).toDate();

      final String firstName = res['firstName'];
      final String lastName = res['lastName'];
      final String email = res['email'];
      final String dateOfBirth = DateConverter.convertDateToAgeInYears(dob);

      emit(ProfileCardLoaded(
        firstName: firstName,
        lastName: lastName,
        email: email,
        dateOfBirth: dateOfBirth,
      ));
    } catch (e) {
      throw Exception(e);
    } finally {}
  }
}
