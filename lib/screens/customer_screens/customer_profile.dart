import 'package:flutter/material.dart';

import 'package:nAndBooking/support_widget/app_font_styling.dart';

class CustomerProfile extends StatelessWidget {
  // final Services service;
  // CustomerProfile(this.service);
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
                padding: EdgeInsets.only(top: 50),
                height: ht / 3,
                width: wt,
                child: CircleAvatar(
                  // radius: 50,
                  backgroundColor: Colors.red[300],
                  child: CircleAvatar(
                    radius: 114,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage: AssetImage('assets/images/cap.jpg'),
                    ),
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
                        Center(
                          child: Text('Lexi Luther',
                              style:
                                  fontStyle(40, Colors.black, FontWeight.w600)),
                        ),
                        Center(
                          child: Text('Seasoned',
                              style: fontStyle(
                                  30, Colors.amber[800], FontWeight.w400)),
                        ),
                        SizedBox(height: ht * 0.01),
                        Text(description, style: fontStyle(14, Colors.black)),
                        SizedBox(height: ht * 0.05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              minWidth: 120,
                              height: 60,
                              child: RaisedButton(
                                color: Colors.green[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 5.0,
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Edit' + '',
                                      style: fontStyle(22, Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 200,
                              height: 60,
                              child: RaisedButton(
                                color: Colors.red[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 5.0,
                                onPressed: () {
                                  // Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => DashBoard()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.explore,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      ' Explore',
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
