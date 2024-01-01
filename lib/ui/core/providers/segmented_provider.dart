import 'package:flutter/material.dart';

class GenderPickerProvider extends ChangeNotifier {
  late String _selectedGender = 'Male';

  void setGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _selectedGender = 'Male';
    super.dispose();
  }

  String get selectedGender => _selectedGender;
}
