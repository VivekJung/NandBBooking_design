import 'package:flutter/material.dart';
import 'package:nAndBooking/screens/customer_screens/customer_sign_Up.dart';
import 'package:nAndBooking/screens/shared_screens/nav_page.dart';
import 'package:nAndBooking/support_widget/app_font_styling.dart';

class CustomerSignIn extends StatefulWidget {
  @override
  _CustomerSignInState createState() => _CustomerSignInState();
}

class _CustomerSignInState extends State<CustomerSignIn> {
  var passCont = TextEditingController();
  var emailCont = TextEditingController();

  login() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => NavPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('N&B Booking ', style: fontStyle(40, Colors.brown[700])),
            Text(
              'Find what you need, Instantly!',
              style: fontStyle(10, Colors.brown[700], FontWeight.w400),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(top: 8, bottom: 4, left: 20, right: 20),
              child: TextFormField(
                controller: emailCont,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
              child: TextFormField(
                controller: passCont,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                // onChanged: (val){
                //   setState(() {

                //   });
                // },
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Password must be at least 5 characters long.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () => login(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text('Login', style: fontStyle(20, Colors.white))),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Or, don\'t have an account? ', style: fontStyle(14)),
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerSignUp()),
                  ),
                  child: Container(
                    width: 100,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(' Register Now ! ',
                          style: fontStyle(10, Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
