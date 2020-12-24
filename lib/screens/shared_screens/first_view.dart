import 'package:flutter/material.dart';
import 'package:nAndBooking/screens/customer_screens/customer_sign_In.dart';
import 'package:nAndBooking/screens/customer_screens/customer_sign_Up.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class FirstView extends StatefulWidget {
  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Container(
            width: wt,
            height: ht,
            color: Colors.white,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('N&B Booking', style: fontStyle(50, Colors.brown[700])),

                  Text(
                    'Making your days easier',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),

                  SizedBox(height: 50),
                  CircleAvatar(
                    radius: 116,
                    backgroundColor: Colors.red[300],
                    child: CircleAvatar(
                      radius: 114,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 110,
                        backgroundImage: AssetImage('assets/images/logo2.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CustomerSignIn()));
                    },
                    child: Container(
                        width: wt / 2,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                            child: Text('Let\'s Get Started',
                                style: fontStyle(20, Colors.white)))),
                  ),
                  //

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CustomerSignUp()));
                    },
                    child: Text(
                      '  Or, Sign up with a new account',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
