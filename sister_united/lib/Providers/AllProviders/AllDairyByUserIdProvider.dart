import 'package:flutter/cupertino.dart';

class AllDairyByUserIDProvider extends ChangeNotifier {
   List _listOfAllPDairy = [1];
  List get listOfAllPDairy => _listOfAllPDairy;
  setlistOfAllPDairy(List list) {
    _listOfAllPDairy = list;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
