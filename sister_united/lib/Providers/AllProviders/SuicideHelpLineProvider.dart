import 'package:flutter/material.dart';

class SuicideHelpLineProvider extends ChangeNotifier {
  List _listofHelpLine = [];
  List get listofHelpLine => _listofHelpLine;
  setlistofHelpLine(List list) {
    _listofHelpLine = list;
    notifyListeners();
  }
}
