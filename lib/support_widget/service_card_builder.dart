import 'package:flutter/material.dart';
import 'package:nAndBooking/models/services.dart';
import 'package:nAndBooking/screens/shared_screens/service_details.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class ServiceCardBuilder extends StatelessWidget {
  final String serviceName;
  final String serviceCategory;
  final String serviceImg;
  final double servicePrice;
  final Services service;

  ServiceCardBuilder(
      {@required this.serviceName,
      @required this.serviceCategory,
      @required this.serviceImg,
      @required this.servicePrice,
      @required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceDetailsView(service)));
        },
        child: Stack(
          children: [
            Container(
              height: 190,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/$serviceImg',
                height: 190,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 160,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent.withOpacity(1),
                        Colors.transparent.withOpacity(1),
                        Colors.transparent.withOpacity(0.9),
                        Colors.transparent.withOpacity(0.8),
                        Colors.transparent.withOpacity(0.7),
                        Colors.transparent.withOpacity(0.6),
                        Colors.transparent.withOpacity(0.6),
                        Colors.transparent.withOpacity(0.5),
                        Colors.transparent.withOpacity(0.4),
                        Colors.transparent.withOpacity(0.3),
                        Colors.transparent.withOpacity(0.2),
                        Colors.transparent.withOpacity(0.1),
                        Colors.transparent.withOpacity(0.07),
                        Colors.transparent.withOpacity(0.05),
                        Colors.transparent.withOpacity(0.03),
                        Colors.transparent.withOpacity(0.02),
                        Colors.transparent.withOpacity(0.01),
                        Colors.transparent.withOpacity(0.00),
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(serviceName, style: fontStyle(16, Colors.white)),
                  Text(serviceCategory, style: fontStyle(10, Colors.white)),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_sharp,
                        size: 14,
                        color: Colors.white,
                      ),
                      Text(
                        ' ' + servicePrice.toString(),
                        style: fontStyle(14, Colors.white, FontWeight.w600),
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
