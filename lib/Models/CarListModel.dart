class CarListModel {
  String CarName;
  String CarImage;
  int StartFromPrice;

  CarListModel({this.CarName, this.CarImage, this.StartFromPrice});

  factory CarListModel.fromJson(Map<String, dynamic> json ){
    return CarListModel(
      CarImage: json['CarImage'],
      CarName: json['CarName'],
      StartFromPrice: json['StartFromPrice']
    );
  }

}