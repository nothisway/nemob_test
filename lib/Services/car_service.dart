import 'dart:convert';
import 'dart:io';

import 'package:nemob_test/Const/Constant.dart';
import 'package:nemob_test/Models/CarListModel.dart';
import 'package:http/http.dart' as http;

class CarService {
  Future<List<CarListModel>> futureCarList() async {
    List<CarListModel> carList = new List<CarListModel>();
    var response = await http.get(ENDPOINT_CARLIST, headers: {
      HttpHeaders.AUTHORIZATION: HEADER
    });
    int statusCode = response.statusCode;
    if (statusCode != 200) {
      print('status carlist: ' + statusCode.toString());
    }
    Iterable list = json.decode(response.body);
    var temp = new List<CarListModel>();
    temp = list.map((model) => CarListModel.fromJson(model)).toList();
    print(temp);
    carList.addAll(temp);
    return carList;
  }
}