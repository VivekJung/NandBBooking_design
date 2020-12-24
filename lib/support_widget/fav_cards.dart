import 'package:flutter/material.dart';
import 'package:nAndBooking/models/services.dart';
import 'package:nAndBooking/support_widget/fav_card_builder.dart';

class FavCard extends StatefulWidget {
  @override
  _FavCardState createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {
  List<Services> fav = [
    Services(
        serviceName: 'First-aid',
        serviceCategory: 'Health',
        servicePrice: 14.99,
        serviceImg: 'firstAid.png'),
    Services(
        serviceName: 'Goods Delivery',
        serviceCategory: 'Misc',
        servicePrice: 7.99,
        serviceImg: 'delivery2.png'),
    Services(
        serviceName: 'Event-organising',
        serviceCategory: 'Management',
        servicePrice: 29.99,
        serviceImg: 'event.jpeg'),
    Services(
        serviceName: 'House-keeping',
        serviceCategory: 'Household',
        servicePrice: 9.99,
        serviceImg: 'houseKeeping.jpg'),
    Services(
        serviceName: 'Office furnishing',
        serviceCategory: 'Repair & Maintenance',
        servicePrice: 19.99,
        serviceImg: 'officefurnising.jpg'),
    Services(
        serviceName: 'Baby-sitting',
        serviceCategory: 'Household',
        servicePrice: 4.99,
        serviceImg: 'babSitting.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      height: ht * 0.362,
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 25, bottom: 20),
          physics: BouncingScrollPhysics(),
          itemCount: fav.length,
          itemBuilder: (_, index) {
            return FavCardBuilder(
              service: fav[index],
              serviceName: fav[index].serviceName,
              serviceCategory: fav[index].serviceCategory,
              servicePrice: fav[index].servicePrice,
              serviceImg: fav[index].serviceImg,
            );
          }),
    );
  }
}
