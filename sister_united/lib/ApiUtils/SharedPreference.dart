import 'package:shared_preferences/shared_preferences.dart';

 class SharedPreferenceClass {
  addToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', "$token");
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('token');
    return stringValue;
  }
}
