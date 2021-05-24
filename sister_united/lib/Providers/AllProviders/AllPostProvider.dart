import 'package:flutter/foundation.dart';

class AllPostProvider extends ChangeNotifier {
  List _listOfAllPost = [];
  List get listOfAllPost => _listOfAllPost;
  setlistOfAllPost(List list) {
    _listOfAllPost = list;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
