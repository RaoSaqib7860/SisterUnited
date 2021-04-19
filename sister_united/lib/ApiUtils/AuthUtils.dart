import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sister_united/Providers/AuthProviders/LoginProvider.dart';
import 'package:sister_united/Providers/AuthProviders/SignUpProvider.dart';

class AuthUtils {
  static const String baseUrl = 'http://135.125.212.109';
  static const String signUp = '/api/Account/UserRegistraion';
  static const String login = '/api/Authentication/login';
  static Future signUpAPi({SignUpProvider provider}) async {
    try {
      var responce = await Dio().post(
        '$baseUrl$signUp',
        data: {
          "id": "",
          "email": provider.emailController.text.toString(),
          "password": provider.passwordController.text.toString(),
          "firstName": provider.fnameController.text.toString(),
          "lastName": provider.lnameController.text.toString(),
          "mobileNumber": provider.mobController.text.toString(),
          "about": "123",
          //  "photo": "string",
          "address": provider.addressController.text.toString(),
          "dob": '2021-04-18T16:07:40.905Z',
          //  "location": "string",
          "nationality": provider.nationController.text.toString(),
          //  "pinNumber": "123"
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
          contentType: Headers.jsonContentType,
          extra: {'accept': '*/*'},
          responseType: ResponseType.json,
        ),
      );
      var data = responce.data;
      //provider.setloading(false);
      print('$data');
      print('${responce.statusCode}');
      if (responce.statusCode == 200) {
      } else {
        // StaticWidget.snackBar(
        //     text:
        //         '${data['message'].toString().replaceAll(']', '').replaceAll('[', '')}',
        //     color: Colors.black,
        //     scaffoldkey: provider.scaffoldkey);
      }
    } catch (e) {}
  }

  static Future loginApi({LoginProvider provider}) async {
    //  var url = Uri.parse('$baseUrl$login');
    try {
      var responce = await Dio().post(
        '$baseUrl$login',
        data: {
          "email": provider.emailController.text.toString(),
          "password": provider.passwordController.text.toString(),
          "fcmToken": 'kmeofoekf3o-ckcckll',
        },
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
          contentType: Headers.jsonContentType,
          extra: {'accept': '*/*'},
          responseType: ResponseType.json,
        ),
      );
      var data = responce.data;
      //provider.setloading(false);
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
      } else {
        // StaticWidget.snackBar(
        //     text:
        //         '${data['message'].toString().replaceAll(']', '').replaceAll('[', '')}',
        //     color: Colors.black,
        //     scaffoldkey: provider.scaffoldkey);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
