import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:patientvisit/core/config/environment_config.dart';

class Repository {
  late Dio dio;
  Repository() {
    _setup();
  }
  String getToken() {
    return "";
  }

  Future<bool> isConnectedToInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      if (isTokenExpired()) {
        // refresh token API called
        return true;
      } else {
        return true;
      }
    } else {
      throw const SocketException("You are disconnected from the internet.");
    }
  }

  _setup() async {
    // Token expire check
    dio = Dio(BaseOptions(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
      baseUrl: apiBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 300000),
    ));
    setupToken();
  }

  bool isTokenExpired() {
    String res = "";
    if (res != "") {
      if (json.decode(res).isNotEmpty) {
        var decodedRes = '';
        final expirationDate = JwtDecoder.getExpirationDate(decodedRes);
        return DateTime.now()
            .add(const Duration(minutes: 2))
            .isAfter(expirationDate);
      }
      return false;
    } else {
      return false;
    }
  }

  void setupToken() {}
}
