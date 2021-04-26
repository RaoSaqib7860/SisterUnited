import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier {

  List _listAllCat=[];
  List get listAllCat=>_listAllCat;
  setlistAllCat(List list){
    _listAllCat=list;
    notifyListeners();
  }

  bool _isAuth=false;
  bool get isAuth=>_isAuth;
  setisAuth(bool v){
    _isAuth=v;
    notifyListeners();
  }
  
}
