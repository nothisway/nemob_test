class ExtraInfoListModel {
  String AppId;
  String AppName;
  String AppPicture;
  String AppProvider;

  ExtraInfoListModel({this.AppId, this.AppName, this.AppPicture,
      this.AppProvider});

  factory ExtraInfoListModel.fromJson(Map<String, dynamic> json) {
    return ExtraInfoListModel(
      AppId: json['AppId'],
      AppName: json['AppName'],
      AppPicture: json['AppPicture'],
      AppProvider: json['AppProvider']
    );
  }

}