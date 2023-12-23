import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:yu_health/data/constants.dart';

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
    } catch (e) {
      throw Exception(e);
    } finally {}
  }
}
