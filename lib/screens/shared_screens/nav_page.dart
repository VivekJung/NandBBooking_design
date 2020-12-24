import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nAndBooking/screens/customer_screens/customer_profile.dart';
import 'package:nAndBooking/screens/shared_screens/dashboard.dart';
import 'package:nAndBooking/screens/shared_screens/log_out.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  //bottomNavBar
  int _pageIndex = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.person,
      page: CustomerProfile(),
    ),
    MyRoute(
      iconData: Icons.search,
      page: Page2(),
    ),
    MyRoute(
      iconData: Icons.home_filled,
      page: DashBoard(),
    ),
    MyRoute(
      iconData: Icons.favorite,
      page: Page2(),
    ),
    MyRoute(
      iconData: Icons.logout,
      page: LogOut(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          color: Colors.red[300],
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.red[300],
          height: 55,
          items: pages
              .map((p) => Icon(p.iconData, size: 22, color: Colors.white))
              .toList(),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        body: pages[_pageIndex].page);
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({this.iconData, this.page});
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Page2'));
  }
}
