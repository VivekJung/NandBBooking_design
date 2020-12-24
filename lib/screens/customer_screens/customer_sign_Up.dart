import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nAndBooking/screens/customer_screens/customer_sign_In.dart';
import 'package:nAndBooking/screens/shared_screens/first_view.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class CustomerSignUp extends StatefulWidget {
  @override
  _CustomerSignUpState createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  bool uploading = false;
  var uNameCont = TextEditingController();
  var passCont = TextEditingController();
  var emailCont = TextEditingController();
  bool _checkVal = false;
  //Image uploader
  File imagePath;
  pickImage(ImageSource imgSource) async {
    final image = await ImagePicker().getImage(source: imgSource);
    setState(() {
      imagePath = File(image.path);
    });
    Navigator.pop(context);
  }

  optionDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.gallery),
              child: Text('Add from gallery', style: fontStyle(16)),
            ),
            SimpleDialogOption(
              onPressed: () => pickImage(ImageSource.camera),
              child: Text('Take new picture', style: fontStyle(16)),
            ),
            SizedBox(height: 20),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: fontStyle(16, Colors.red)),
            ),
          ],
        );
      },
    );
  }

  signUp() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => FirstView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('N&B Booking', style: fontStyle(40, Colors.brown[700])),
              Text(
                'The first step is the most important one',
                style: fontStyle(10, Colors.brown[700], FontWeight.w400),
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 58,
                backgroundColor: Colors.green[400],
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage('assets/images/logo2.png'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 20, right: 20),
                child: TextFormField(
                  controller: uNameCont,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 8, bottom: 4, left: 20, right: 20),
                child: TextFormField(
                  cursorColor: Colors.brown[700],
                  controller: emailCont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.teal, width: 1),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    top: 4, bottom: 4, left: 20, right: 20),
                child: TextFormField(
                  controller: passCont,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(
                      Icons.vpn_key,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //Pro Pic
              Container(
                margin: EdgeInsets.all(20),
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green[300],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton.icon(
                        onPressed: () {
                          optionDialog();
                        },
                        icon: Icon(Icons.image, color: Colors.white),
                        label: Text('Tap here to add your Pic ',
                            style: fontStyle(14, Colors.white))),
                    imagePath == null
                        ? CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    AssetImage('assets/images/lexi.jpg')),
                          )
                        // : MediaQuery.of(context).viewInsets.bottom > 0

                        : CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.red[100],
                                backgroundImage: FileImage(imagePath)),
                          ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _checkVal,
                        activeColor: Colors.brown[700],
                        onChanged: (newVal) {
                          setState(() {
                            _checkVal = newVal;
                          });
                        },
                      ),
                      Text('I hereby agree with all the', style: fontStyle(10)),
                    ],
                  ),
                  InkWell(
                    onTap: () => termsDialogBox(context),
                    child: Container(
                      width: 110,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text('Terms and Policies',
                            style: fontStyle(10, Colors.brown[900])),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //signup button

              FlatButton(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Text('Register Now!',
                          style: fontStyle(20, Colors.white))),
                ),
                onPressed: () {
                  if (_checkVal != true) {
                    dialogBox(context);
                  } else {
                    signUp();
                  }
                },
              ),

              SizedBox(height: 20),

              // dont have account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Or, already have an account?', style: fontStyle(14)),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomerSignIn()),
                        );
                      },
                      child: Container(
                        width: 65,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(' Login ',
                              style: fontStyle(12, Colors.white)),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dialogBox(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Oops!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Looks like you missed our \'Terms & Policies\' section.',
                style: fontStyle(15, Colors.amber[900])),
            SizedBox(height: 15),
            Text('Please check and re-try', style: fontStyle(14, Colors.black)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Ok, I\'ll check',
            style: fontStyle(12, Colors.brown[700]),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void termsDialogBox(BuildContext context) {
    var alert = AlertDialog(
      title: Text(
        'Terms | Policies | Conditions',
        style: fontStyle(18, Colors.amber[800]),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              '1. Full copyright on each and every contents of this app by the authur.',
              style: fontStyle(12, Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              '2. Permission is strictly denied to reproduce or sell this app or any part of this.',
              style: fontStyle(12, Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              '3. All the informations provided are to be used by user consent only and shall not be used for personal benefits or other hidden agenda',
              style: fontStyle(12, Colors.black),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            Icon(
              Icons.check,
              size: 14,
              color: Colors.green[800],
            ),
            TextButton(
              child: Text(
                ' I have read all the terms',
                style: fontStyle(12, Colors.green[700]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}
