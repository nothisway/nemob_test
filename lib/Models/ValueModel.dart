import 'package:nemob_test/Models/ExtraInfoListModel.dart';
import 'package:nemob_test/Models/ExtraProfileModel.dart';
import 'package:nemob_test/Screens/LoginScreen/login_screen.dart';

class ValueModel {
  String UserId;
  String DisplayName;
  String FirstName;
  String LastName;
  String Email;
  bool EmailConfirmed;
  String PhoneNumber;
  bool PhoneNumberConfirmed;
  bool EnabledRentWithKey;
  String AccountType;
  bool IsLister;
  bool VerifiedMember;
  String LastLogin;
  List<ExtraInfoListModel> ExtraInfoList;
  ExtraProfileModel ExtraProfile;
  List Roles;
  String AffiliatedId;

  ValueModel({this.UserId, this.DisplayName, this.FirstName, this.LastName,
      this.Email, this.EmailConfirmed, this.PhoneNumber,
      this.PhoneNumberConfirmed, this.EnabledRentWithKey, this.AccountType,
      this.IsLister, this.VerifiedMember, this.LastLogin, this.ExtraInfoList,
      this.ExtraProfile, this.Roles, this.AffiliatedId});

  factory ValueModel.fromJson(Map<String, dynamic> json) {
    var extraInfoList = json['ExtraInfoList'] as List;
    List<ExtraInfoListModel> _ExtraInfoList = extraInfoList.map((f) => ExtraInfoListModel.fromJson(f)).toList();
    var _ExtraProfile = ExtraProfileModel.fromJson(json['ExtraProfile']);
    return ValueModel(
      UserId: json['UserId'],
      DisplayName: json['DisplayName'],
      FirstName: json['FirstName'],
      LastName: json['LastName'],
      Email: json['Email'],
      EmailConfirmed: json['EmailConfirmed'],
      PhoneNumber: json['PhoneNumber'],
      PhoneNumberConfirmed: json['PhoneNumberConfirmed'],
      EnabledRentWithKey: json['EnabledRentWithKey'],
      AccountType: json['AccountType'],
      IsLister: json['IsLister'],
      VerifiedMember: json['VerifiedMember'],
      LastLogin: json['LastLogin'],
      ExtraInfoList: _ExtraInfoList,
      ExtraProfile: _ExtraProfile,
      Roles: json['Roles'] as List,
      AffiliatedId: json['AffiliatedId']
    );
  }


}