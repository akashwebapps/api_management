import 'dart:convert';

import 'package:api_management/helper/DioNetwork.dart';
import 'package:api_management/helper/logger.dart';
import 'package:api_management/model/LoginResponse.dart';
import '../helper/Constant.dart';
import 'package:dio/dio.dart';

class LoginService {
  Future<LoginResponse?> login(
      String emailId, String password, String firebaseToken) async {
    Map<String, dynamic> jsonObject = {
      "email": emailId,
      "password": password,
      "firebaseToken": firebaseToken,
    };

    try {
      final response = await DioNetworkProvider.instance.dio
          .post(webUrl + "login", data: jsonObject);
      if (response.statusCode == 200 && response.data != null) {
        final res = LoginResponse.fromJson(response.data);
        CustomLogger.debug("$emailId - $password $firebaseToken");
        CustomLogger.debug(res.toJson());
        return res;
      }
    } catch (e) {
      CustomLogger.error(e);
      return Future.error(e);
    }
    return null;
  }
}
