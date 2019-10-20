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
              })
        ],
      ),
    );
  }

  Widget _carAdapter(
      BuildContext context, int index, List<CarListModel> listItem) {
//    print(listItem[0].harga.toString());
    return CarCard(
          image: listItem[index].CarImage,
          price: listItem[index].StartFromPrice.toString(),
          name: listItem[index].CarName,
        );
  }
}
