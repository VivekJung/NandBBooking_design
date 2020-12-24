import 'package:flutter/material.dart';
import 'package:nAndBooking/models/services.dart';
import 'package:nAndBooking/screens/shared_screens/service_details.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class FavCardBuilder extends StatelessWidget {
  final String serviceName;
  final String serviceCategory;
  final String serviceImg;
  final double servicePrice;
  final Services service;

  FavCardBuilder(
      {@required this.serviceName,
      @required this.serviceCategory,
      @required this.serviceImg,
      @required this.servicePrice,
      @required this.service});

  @override
  Widget build(BuildContext context) {
    var wt = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: wt - 50,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceDetailsView(service)));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/$serviceImg',
                height: 75,
                width: 78,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 75,
              width: wt - 110,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(serviceName, style: fontStyle(16, Colors.black)),
                  Text(serviceCategory, style: fontStyle(10, Colors.grey)),
                  Row(
                    children: [
                      Text(
                        servicePrice.toString(),
                        style: fontStyle(14, Colors.black, FontWeight.w600),
                      ),
                      Icon(
                        Icons.attach_money_sharp,
                        size: 14,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
