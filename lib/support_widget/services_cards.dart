import 'package:flutter/material.dart';
import 'package:nAndBooking/models/services.dart';
import 'package:nAndBooking/support_widget/service_card_builder.dart';

class ServicesCard extends StatefulWidget {
  @override
  _ServicesCardState createState() => _ServicesCardState();
}

class _ServicesCardState extends State<ServicesCard> {
  List<Services> daily = [
    Services(
        serviceName: 'House-keeping',
        serviceCategory: 'Household',
        servicePrice: 9.99,
        serviceImg: 'houseKeeping.jpg'),
    Services(
        serviceName: 'Baby-sitting',
        serviceCategory: 'Household',
        servicePrice: 4.99,
        serviceImg: 'babSitting.jpg'),
    Services(
        serviceName: 'Goods Delivery',
        serviceCategory: 'Misc',
        servicePrice: 7.99,
        serviceImg: 'delivery2.png'),
    Services(
        serviceName: 'First-aid',
        serviceCategory: 'Health',
        servicePrice: 14.99,
        serviceImg: 'firstAid.png'),
    Services(
        serviceName: 'Event-organising',
        serviceCategory: 'Management',
        servicePrice: 29.99,
        serviceImg: 'event.jpeg'),
    Services(
        serviceName: 'Office furnishing',
        serviceCategory: 'Repair & Maintenance',
        servicePrice: 19.99,
        serviceImg: 'officefurnising.jpg'),
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
    return Container(
      height: 200,
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
          padding: EdgeInsets.only(left: 25, right: 10),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: daily.length,
          itemBuilder: (_, index) {
            return ServiceCardBuilder(
              service: daily[index],
              serviceName: daily[index].serviceName,
              serviceCategory: daily[index].serviceCategory,
              servicePrice: daily[index].servicePrice,
              serviceImg: daily[index].serviceImg,
            );
          }),
    );
  }
}
