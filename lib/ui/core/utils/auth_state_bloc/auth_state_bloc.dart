import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state_event.dart';
part 'auth_state_state.dart';

class AuthStateBloc extends Bloc<AuthStateEvent, AuthStateState> {
  final _auth = FirebaseAuth.instance;
  AuthStateBloc() : super(AppLoading()) {
    _auth.authStateChanges().listen((user) {
      print('Auth state changed');
      add(user != null ? AutoLoginEvent() : LogoutEvent());
    });
    on<AutoLoginEvent>((event, emit) => emit(UserLoggedIn()));
    on<LogoutEvent>((event, emit) => emit(UserLoggedOut()));
  }
}
