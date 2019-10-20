import 'dart:convert';
import 'dart:io';

import 'package:nemob_test/Const/Constant.dart';
import 'package:nemob_test/Models/LoginModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<LoginModel> login(String url, {Map body}) async {
  print(body);
  return http.post(url, body: body, headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.AUTHORIZATION: HEADER
  }).then((http.Response response) {
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400 || json == null) {
      print('Error: $statusCode');
      return null;
//      throw new Exception("Error while fetching data");
    }
    Map userData = json.decode(response.body);
    print(userData);
    LoginModel loginData = new LoginModel.fromJson(userData);
    return loginData;
  });
}