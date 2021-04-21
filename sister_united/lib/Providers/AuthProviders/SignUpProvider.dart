import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  TextEditingController _fnameController = TextEditingController();
  TextEditingController get fnameController => _fnameController;
  TextEditingController _lnameController = TextEditingController();
  TextEditingController get lnameController => _lnameController;

  TextEditingController _dobController = TextEditingController();
  TextEditingController get dobController => _dobController;

  TextEditingController _nationController = TextEditingController();
  TextEditingController get nationController => _nationController;

  TextEditingController _mobController = TextEditingController();
  TextEditingController get mobController => _mobController;

  TextEditingController _addressController = TextEditingController();
  TextEditingController get addressController => _addressController;

  bool _loading = false;
  bool get loading => _loading;
  setloading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
