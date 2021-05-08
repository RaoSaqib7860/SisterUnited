import 'package:flutter/foundation.dart';

class AllDairyProvider extends ChangeNotifier {
  List _listOfAllDairy = [];
  List get listOfAllDairy => _listOfAllDairy;
  setlistOfAllDairy(List list) {
    _listOfAllDairy = list;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
