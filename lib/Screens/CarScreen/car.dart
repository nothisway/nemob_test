import 'package:flutter/material.dart';
import 'package:nemob_test/Models/CarListModel.dart';
import 'package:nemob_test/Screens/CarScreen/widget/car_card.dart';
import 'package:nemob_test/Services/car_service.dart';

class Car extends StatefulWidget {
  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  double _height;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:
            Image.network('https://nemob.id/Content/image/icon/logo_white.png'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Select Car'),
          ),
          FutureBuilder(
              future: CarService().futureCarList(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    height: _height,
                      child: Center(
                    child: Text(
                      'Fetching Data ...',
                      style: TextStyle(
                          color: Colors.black, fontSize: 16),
                    ),
                  ));
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(5),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, index) {
                     return _carAdapter(context, index, snapshot.data);
                    },
                  );
                }
              }),
          Container(
            height: _height / 4,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Text(
              'Hidup terlalu pendek untuk mengendarai mobil yang itu-itu saja'
                  'di Nemob anda dapat menyewa berbagai mobil spesial seperti Lamborgini, Ferari'
                  'Lemus, Hummel, Range Rover, BMW, Mercedez Benz, Porche dan masih banyak lagi'
                  'pada nemob App. Nemob ada untuk memudahkan anda untuk menyewa mobil untuk keperluan liburan,'
                  'pernikahan atau kebutuhan bisnis. Sewa mobil mewah menjadi lebih mudah di Nemob'
                  'dapatkan harga terbaik. pesan Sekarang !', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _carAdapter(
      BuildContext context, int index, List<CarListModel> listItem) {
    return CarCard(
          image: listItem[index].CarImage,
          price: listItem[index].StartFromPrice.toString(),
          name: listItem[index].CarName,
        );
  }
}
