import 'package:flutter/material.dart';

class ObscurePasswordProvider extends ChangeNotifier {
  late bool _loginPasswordHidden = true;
  late bool _confirmPasswordHidden = true;
  late bool _passwordHidden = true;

  void toggleLoginPasswordVisibility() {
    _loginPasswordHidden = !_loginPasswordHidden;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _passwordHidden = !_passwordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _confirmPasswordHidden = !_confirmPasswordHidden;
    notifyListeners();
  }

  @override
  void dispose() {
    _confirmPasswordHidden = true;
    _passwordHidden = true;
    _loginPasswordHidden = true;
    notifyListeners();
    super.dispose();
  }

  bool get loginPasswordHidden => _loginPasswordHidden;
  bool get passwordHidden => _passwordHidden;
  bool get confirmPasswordHidden => _confirmPasswordHidden;
}
