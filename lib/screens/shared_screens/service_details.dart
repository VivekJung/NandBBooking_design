import 'package:flutter/material.dart';
import 'package:nAndBooking/models/services.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class ServiceDetailsView extends StatelessWidget {
  final Services service;
  ServiceDetailsView(this.service);
  @override
  Widget build(BuildContext context) {
    String description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n \n It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: ht * 0.45,
                width: wt,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/images/${service.serviceImg}',
                    height: ht * 0.45,
                    width: wt,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service.serviceCategory,
                            style: fontStyle(12, Colors.grey)),
                        Text(service.serviceName,
                            style:
                                fontStyle(30, Colors.black, FontWeight.w600)),
                        SizedBox(height: ht * 0.01),
                        Text(description, style: fontStyle(14, Colors.black)),
                        SizedBox(height: ht * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 120,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.amber[600],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    service.servicePrice.toString() + '*',
                                    style: fontStyle(22, Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 200,
                              height: 60,
                              child: RaisedButton(
                                color: Colors.red[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5.0,
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.book_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      ' Book Now!',
                                      style: fontStyle(
                                          22, Colors.white, FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
