import 'dart:io';

import 'package:flutter/cupertino.dart';

class WeightDairyProvider extends ChangeNotifier {
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
  int _fistWieghtValue=50;
  int get fistWieghtValue=>_fistWieghtValue;
  setfistWieghtValue(int value){
    _fistWieghtValue=value;
    notifyListeners();
  }
  int _secondWieghtValue=30;
  int get secondWieghtValue=>_secondWieghtValue;
  setsecondWieghtValue(int value){
    _secondWieghtValue=value;
    notifyListeners();
  }
}
