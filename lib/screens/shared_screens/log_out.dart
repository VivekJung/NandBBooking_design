import 'package:flutter/material.dart';
import 'package:nAndBooking/screens/shared_screens/first_view.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logOut() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FirstView()));
    }

    return Container(
      margin: EdgeInsets.only(left: 55),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Are you Sure ?',
            style: fontStyle(30, Colors.red[800]),
          ),
          Text(
            '\nBy pressing the button below, you will be signed out of this app.\nYou won\'t be able to continue with the features as well.\n\n Do not leave any pending task before you log out.',
            style: fontStyle(10),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.brown[700],
            child: IconButton(
                icon: Icon(Icons.logout, color: Colors.white, size: 30),
                onPressed: () => logOut()),
          )
        ],
      ),
    );
  }
}
