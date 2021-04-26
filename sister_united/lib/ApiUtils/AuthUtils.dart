import 'dart:convert';
import 'dart:developer';
import 'package:confetti/confetti.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/SharedPreference.dart';
import 'package:sister_united/Authentication/Login.dart';
import 'package:sister_united/HomePage.dart';
import 'package:sister_united/Providers/AllProviders/HomePageProvider.dart';
import 'package:sister_united/Providers/AuthProviders/ForgotPasswordProvider.dart';
import 'package:sister_united/Providers/AuthProviders/LoginProvider.dart';
import 'package:sister_united/Providers/AuthProviders/SignUpProvider.dart';

class AuthUtils {
  static String token = '';
  static const String baseUrl = 'http://135.125.212.109';
  static const String signUp = '/api/Account/UserRegistraion';
  static const String login = '/api/Authentication/login';
  static const String forgotPassword = '/api/Account/ForgetPassword';
  static const String updatePassword = '/api/Account/UpdateForgetPassword';
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
          "dob": provider.dobController.text.toString(),
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
      provider.setloading(false);
      print('$data');
      print('${responce.statusCode}');
      if (responce.statusCode == 400) {
        Map map = jsonDecode(data);
        Map newMap = map['errors'];
        if (newMap.containsKey('MobileNumber')) {
          Get.snackbar('Error',
              '${newMap['MobileNumber'].toString().replaceAll(']', '').replaceAll('[', '').trim().toString()}',
              barBlur: 10.0);
        } else {
          Get.snackbar('Error', '${map['errors']}', barBlur: 10.0);
        }
      } else {
        if (data['status'] == 'Fail') {
          Get.snackbar('Error', data['payload']['errors'][0]['description'],
              barBlur: 10.0);
        } else if (data['status'] == 'Success') {
          Get.snackbar('Success', 'User Registered !', barBlur: 10.0);
          Future.delayed(Duration(seconds: 3), () {
            Get.offAll(ChangeNotifierProvider(
              child: Login(),
              create: (_) => LoginProvider(),
            ));
          });
        } else {
          Map map = jsonDecode(data);
          Get.snackbar('Error', '${map['errors']}', barBlur: 10.0);
        }
      }
    } catch (e) {}
  }

  static Future loginApi({LoginProvider provider,ConfettiController con}) async {
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
      provider.setloading(false);
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (data['status'] == 'Fail') {
        Get.snackbar('Error', data['message'], barBlur: 10.0);
      } else if (data['status'] == 'Success') {
        con.play();
        Get.snackbar('Success', data['message'], barBlur: 10.0);
        token = '${data['payload']['token']['tokenString']}';
        log('token is = $token');
        SharedPreferenceClass msmcd = SharedPreferenceClass();
        msmcd.addToken(token);
        Future.delayed(Duration(seconds: 3), () {
          Get.to(ChangeNotifierProvider(
            child: HomePage(),
            create: (_) => HomePageProvider(),
          ));
        });
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apiforgotPassword({ForgotpasswordProvider provider}) async {
    //  var url = Uri.parse('$baseUrl$login');
    try {
      var responce = await Dio().post(
        '$baseUrl$forgotPassword',
        queryParameters: {"email": provider.emailController.text.toString()},
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
      provider.setloading(false);
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (data['status'] == 'Fail') {
        Get.snackbar('Error', data['message'], barBlur: 10.0);
      } else if (data['status'] == 'Success') {
        Get.snackbar('Success', data['message'], barBlur: 10.0);
        provider.setispassword(true);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apiupdatePassword({ForgotpasswordProvider provider}) async {
    //  var url = Uri.parse('$baseUrl$login');
    try {
      var responce = await Dio().post(
        '$baseUrl$updatePassword',
        data: {
          "email": provider.emailController.text.toString(),
          "password": provider.passwordController.text.toString(),
          "token": 'skdmceo'
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
      provider.setloading(false);
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (data['status'] == 'Fail') {
        Get.snackbar('Error', data['message'], barBlur: 10.0);
      } else if (data['status'] == 'Success') {
        Get.snackbar('Success', data['message'], barBlur: 10.0);
        provider.setispassword(true);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
