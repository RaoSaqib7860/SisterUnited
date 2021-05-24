import 'dart:io';

import 'package:flutter/cupertino.dart';

class AddnewPostProvider extends ChangeNotifier {
  TextEditingController _titleCon = TextEditingController();
  TextEditingController get titleCon => _titleCon;
  TextEditingController _descriptionCon = TextEditingController();
  TextEditingController get descriptionCon => _descriptionCon;

  File _file;
  File get file => _file;
  setFile(dynamic f) {
    _file = f;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
