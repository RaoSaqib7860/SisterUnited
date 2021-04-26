import 'package:flutter/foundation.dart';

class SubcatProvider extends ChangeNotifier {

  List _listOfAllSubCat=[];
  List get listOfAllSubCat=>_listOfAllSubCat;
  setlistOfAllSubCat(List list){
    _listOfAllSubCat=list;
    notifyListeners();
  }
  
}