class ExtraProfileModel {
  String Address;
  String City;
  String State;
  int ZipCode;
  String Works;
  String School;
  String About;
  String JoinDate;
  String RefCode;

  ExtraProfileModel({this.Address, this.City, this.State, this.ZipCode,
      this.Works, this.School, this.About, this.JoinDate, this.RefCode});

  factory ExtraProfileModel.fromJson(Map<String, dynamic> json) {
    return ExtraProfileModel(
      Address: json['Address'],
      City: json['City'],
      State: json['State'],
      ZipCode: json['ZipCode'],
      Works: json['Works'],
      School: json['School'],
      About: json['About'],
      JoinDate: json['JoinDate'],
      RefCode: json['RefCode']
    );
  }

}