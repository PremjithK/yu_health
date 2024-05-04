import 'package:flutter/material.dart';

class DoctorFilterProvider with ChangeNotifier {
  late Set<String> _selectedFilters = {};

  void addToFilter(String item) {
    _selectedFilters.add(item);
    notifyListeners();
  }

  void removeFromFilter(String item) {
    _selectedFilters.remove(item);
    notifyListeners();
  }

  void clearAll() {
    _selectedFilters.clear();
    notifyListeners();
  }

  List<String> get selectedFilters => _selectedFilters.toList();
}
