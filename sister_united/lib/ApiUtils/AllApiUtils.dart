import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:sister_united/ApiUtils/AuthUtils.dart';
import 'package:sister_united/Providers/AllProviders/AllDairyProvider.dart';
import 'package:sister_united/Providers/AllProviders/HomePageProvider.dart';
import 'package:sister_united/Providers/AllProviders/SubCatProvider.dart';

class AllApiUtils {
  static const String baseUrl = 'https://sistersunited.azurewebsites.net';
  static const String getAllCategory = '/api/Category/GetAll';
  static const String getAllSubCategory = '/api/SubCategory/GetAll';
  static const String getAllDairy = '/api/DairyPost/GetAll';


  static Future apigetAllCategory({HomePageProvider provider}) async {
    log('${AuthUtils.token}');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllCategory',
        queryParameters: {'PageSize': '1', 'Row': '10'},
        options: Options(
          headers: {'Authorization':'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if(responce.statusCode==200){
        provider.setlistAllCat(data['payload']);
      }else{
        provider.setisAuth(true);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
   static Future apigetAllSubCategory({SubcatProvider provider,String id}) async {
    log('${AuthUtils.token}');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllSubCategory',
        queryParameters: {'PageSize': '1', 'Row': '10'},
        options: Options(
          headers: {'Authorization':'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if(responce.statusCode==200){
       provider.setlistOfAllSubCat(data['payload']??[]);
      }else{
      
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
    static Future apigetAllDairy({AllDairyProvider provider,String id}) async {
    log('${AuthUtils.token}');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllDairy',
        queryParameters: {'PageSize': '1', 'Row': '10'},
        options: Options(
          headers: {'Authorization':'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if(responce.statusCode==200){
      provider.setlistOfAllDairy(data['payload']);
      }else{
      
      }
      provider.setloading(true);
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
