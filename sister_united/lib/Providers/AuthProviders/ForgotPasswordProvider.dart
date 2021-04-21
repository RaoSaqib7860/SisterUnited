import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotpasswordProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  TextEditingController _repasswordController = TextEditingController();
  TextEditingController get repasswordController => _repasswordController;

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }

  bool _ispassword = false;
  bool get ispassword => _ispassword;
  setispassword(bool v) {
    _ispassword = v;
    notifyListeners();
  }
}
