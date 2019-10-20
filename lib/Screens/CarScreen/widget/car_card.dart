import 'dart:ui';

import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  double _height;
  String image, name, price;
  String placeholder;

  CarCard({this.image, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    placeholder = 'https://d2v9k5u4v94ulw.cloudfront.net/assets/images/392400/original/f4ec8c7f-1ff5-410c-b08a-d26e9c62111f.gif?1463729173';
    return Container(
      height: _height / 5,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          image == null ? image = placeholder: image,
                      ), fit: BoxFit.fill)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )),
        ),
      ),
    );
  }
}
