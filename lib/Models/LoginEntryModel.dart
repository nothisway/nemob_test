class LoginEntryModel {
  String email;
  String password;

  LoginEntryModel({this.email, this.password});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}