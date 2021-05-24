import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sister_united/ApiUtils/AuthUtils.dart';
import 'package:sister_united/ApiUtils/SharedPreference.dart';
import 'package:sister_united/Providers/AllProviders/AddNewPostProvider.dart';
import 'package:sister_united/Providers/AllProviders/AllDairyByUserIdProvider.dart';
import 'package:sister_united/Providers/AllProviders/AllPostProvider.dart';
import 'package:sister_united/Providers/AllProviders/CreateDairyProvider.dart';
import 'package:sister_united/Providers/AllProviders/HomePageProvider.dart';
import 'package:sister_united/Providers/AllProviders/SubCatProvider.dart';
import 'package:sister_united/Providers/AllProviders/SuicideHelpLineProvider.dart';

import '../AllDairyByUserId.dart';
import '../AllPosts.dart';

class AllApiUtils {
  static const String baseUrl = 'https://sistersunited.azurewebsites.net';
  static const String getAllCategory = '/api/Category/GetAll';
  static const String getAllSubCategorybyId =
      '/api/SubCategory/GetAllByCategoryId';
  static const String getAllPostByID = '/api/Post/GetAllPostsBySubCategoryId';
  static const String createPost = '/api/Post/Create';
  static const String createDairy = '/api/Dairy/Create';
  static const String allDairybyID = '/api/Dairy/GetAllByUserId';
  static const String helpline = '/api/HelpLine/GetAllByType';

  static Future apigetAllCategory({HomePageProvider provider}) async {
    log('${AuthUtils.token}');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllCategory',
        queryParameters: {'PageSize': '1', 'Row': '10'},
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistAllCat(data['payload']);
      } else {
        provider.setisAuth(true);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apigetAllSubCategory(
      {SubcatProvider provider, String id}) async {
    log('id is = $id');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllSubCategorybyId',
        queryParameters: {'PageSize': '1', 'Row': '10', 'CategoryId': id},
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistOfAllSubCat(data['payload'] ?? []);
      } else {}
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apigetAllPost({AllPostProvider provider, String id}) async {
    log('id is = $id');
    try {
      var responce = await Dio().get(
        '$baseUrl$getAllPostByID',
        queryParameters: {'PageSize': '1', 'Row': '10', 'SubCategoryId': id},
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistOfAllPost(data['payload']);
      } else {}
      provider.setloading(true);
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apiCreatePost(AddnewPostProvider provider, String id) async {
    log('id is =$id ${provider.titleCon.text} ${provider.descriptionCon.text}');
    try {
      var responce = await Dio().post(
        '$baseUrl$createPost',
        data: {
          "id": 0,
          "title": provider.titleCon.text,
          "description": provider.descriptionCon.text,
          "photo": "string",
          "fkSubCategoryId": int.parse(id),
          "status": "string"
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setloading(false);
        Get.back();
        Get.back();
        Get.to(ChangeNotifierProvider(
            create: (_) => AllPostProvider(),
            child: AllPosts(
              subCatId: id,
            )));
      } else {}
    } catch (e) {
      log('${e.toString()}');
    }
    provider.setloading(false);
  }

  static Future apiCreateDairy(CreateDairyProvider provider) async {
    SharedPreferenceClass msmcd = SharedPreferenceClass();
    String userID = await msmcd.getUserId();
    log('user id =m $userID');
    try {
      var responce = await Dio().post(
        '$baseUrl$createDairy',
        data: {
          "id": 0,
          "title": provider.titleController.text,
          "descripition": provider.descriptionController.text,
          "date": provider.timeZone,
          "photo": "string",
          "weight": '${provider.fistWieghtValue}' +
              '.' +
              '${provider.secondWieghtValue}',
          "notes": provider.notesController.text,
          "emojis": "string",
          "fkUserId": userID
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        Get.back();
        Get.back();
        Get.to(ChangeNotifierProvider(
          child: AllDairyByUserID(),
          create: (_) => AllDairyByUserIDProvider(),
        ));
      } else {}
    } catch (e) {
      log('${e.toString()}');
    }
    provider.setloading(false);
  }

  static Future apiallDairyData(AllDairyByUserIDProvider provider) async {
    SharedPreferenceClass msmcd = SharedPreferenceClass();
    String userID = await msmcd.getUserId();
    try {
      var responce = await Dio().get(
        '$baseUrl$allDairybyID',
        queryParameters: {'PageSize': '1', 'Row': '10', 'UserId': userID},
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistOfAllPDairy(data['payload']);
      } else {}
      provider.setloading(true);
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apiSuicideHelpLine(SuicideHelpLineProvider provider) async {
    log('get api calling');
    try {
      var responce = await Dio().get(
        '$baseUrl$helpline',
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistofHelpLine(data['payload']);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }

  static Future apiYouthHelpLine(SuicideHelpLineProvider provider) async {
    try {
      var responce = await Dio().get(
        '$baseUrl$helpline',
        queryParameters: {'PageSize': '1', 'Row': '10', 'Type': '2'},
        options: Options(
          headers: {'Authorization': 'Bearer ${AuthUtils.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status <= 500;
          },
        ),
      );
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        provider.setlistofHelpLine(data['payload']);
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
