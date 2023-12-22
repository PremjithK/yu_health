import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';

class AuthRepository {
  // final Uuid _uuid = const Uuid();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (err) {
      return err.code;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }

  Future<User?> signup({
    required String firstName,
    required String lastName,
    required DateTime dateOfBirth,
    required String gender,
    required String email,
    required String password,
    required double phoneNumber,
  }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'email': email,
        'phoneNumber': phoneNumber,
      });
    }

    return user;
  }
}
