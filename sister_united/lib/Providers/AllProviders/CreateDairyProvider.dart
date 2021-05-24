import 'dart:io';

import 'package:flutter/material.dart';

class CreateDairyProvider extends ChangeNotifier {
  TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController get descriptionController => _descriptionController;

  TextEditingController _notesController = TextEditingController();
  TextEditingController get notesController => _notesController;

  File _file;
  File get file => _file;
  setFile(dynamic f) {
    _file = f;
    notifyListeners();
  }

  String _selectedDate = '';
  String get selectedDate => _selectedDate;
  setSelectedDate(String value) {
    _selectedDate = value;
    notifyListeners();
  }

  int _fistWieghtValue = 50;
  int get fistWieghtValue => _fistWieghtValue;
  setfistWieghtValue(int value) {
    _fistWieghtValue = value;
    notifyListeners();
  }

  int _secondWieghtValue = 30;
  int get secondWieghtValue => _secondWieghtValue;
  setsecondWieghtValue(int value) {
    _secondWieghtValue = value;
    notifyListeners();
  }

  String _timeZone = '';
  String get timeZone => _timeZone;
  setTimeZone(String time) {
    _timeZone = time;
    notifyListeners();
  }
   bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
