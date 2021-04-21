import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sister_united/ApiUtils/AuthUtils.dart';
import 'package:sister_united/Providers/AllProviders/HomePageProvider.dart';

class AllApiUtils {
  static const String baseUrl = 'http://135.125.212.109';
  static const String getAllCategory = '/api​/Category​/GetAll';

  static Future apigetAllCategory({HomePageProvider provider}) async {
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllCategory',
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
          contentType: Headers.jsonContentType,
          extra: {'accept': '*/*'},
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          responseType: ResponseType.json,
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      // if (data['status'] == 'Fail') {
      //   Get.snackbar('Error', data['message'], barBlur: 10.0);
      // } else if (data['status'] == 'Success') {
      //   Get.snackbar('Success', data['message'], barBlur: 10.0);
      // }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
