import 'package:nemob_test/Models/ValueModel.dart';

class LoginModel {
  List<ValueModel> value;

  LoginModel({this.value});

  factory LoginModel.fromJson(Map<String , dynamic> json ){
    var list = json['value'] as List;
    List<ValueModel> _value = list.map((f) => ValueModel.fromJson(f)).toList();
    return LoginModel(
      value: _value
    );
  }

}