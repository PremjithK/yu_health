import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerProvider extends ChangeNotifier {
  final TextEditingController dateTimeController = TextEditingController()
    ..text = '2000/1/1';
  late DateTime _date = DateTime(2000);

  void setDate(DateTime selectedDate) {
    dateTimeController.text = DateFormat('yyyy/MM/dd').format(selectedDate);
    _date = selectedDate;
    notifyListeners();
  }

  @override
  void dispose() {
    dateTimeController.dispose();
    super.dispose();
  }

  DateTime get date => _date;
}
