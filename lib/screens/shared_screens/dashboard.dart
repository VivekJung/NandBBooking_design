import 'package:flutter/material.dart';

import 'package:nAndBooking/support_widget/app_font_styling.dart';
import 'package:nAndBooking/support_widget/fav_cards.dart';
import 'package:nAndBooking/support_widget/services_cards.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isSearchActive = false;
  String filter = '';

  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wt = MediaQuery.of(context).size.width;
    return Container(
      height: ht,
      width: wt,
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi! Lexy,', style: fontStyle(14, Colors.grey[600])),
                Text('Book your services', style: fontStyle(22, Colors.black)),
              ],
            ),
          ),
          buildSearchBar(wt),
          buildTabBar(),
          ServicesCard(),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10),
            child: Text('Favorites', style: fontStyle(22, Colors.black)),
          ),
          FavCard(),
        ],
      ),

      // bottomNavigationBar: CurvedNavigationBar(
      //   index: 2,
      //   color: Colors.red[300],
      //   backgroundColor: Colors.white,
      //   buttonBackgroundColor: Colors.red[300],
      //   height: 55,
      //   items: [
      //     Icon(Icons.person, size: 22, color: Colors.white),
      //     Icon(Icons.search, size: 22, color: Colors.white),
      //     Icon(Icons.home_filled, size: 22, color: Colors.white),
      //     Icon(Icons.favorite, size: 22, color: Colors.white),
      //     Icon(Icons.logout, size: 22, color: Colors.white),
      //   ],
      //   animationDuration: Duration(milliseconds: 300),
      //   animationCurve: Curves.easeOutCubic,
      //   onTap: (index) {
      //     setState(() {

      //     });
      //   },
      // ),
    );
  }

  buildSearchBar(wt) {
    return Container(
      height: isSearchActive == false ? 40.0 : 100.0,
      width: wt,
      margin: EdgeInsets.only(left: 25, right: 25, top: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber[50],
      ),
      //Search Bar
      child: Stack(
        children: [
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Colors.black87,
            maxLengthEnforced: true,
            style: fontStyle(12, Colors.black, FontWeight.w600),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 18, right: 50, bottom: 8),
              border: InputBorder.none,
              hintText: '  Search ...',
              hintStyle: fontStyle(12),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[300],
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearchActive = !isSearchActive;
                    });
                  }),
            ),
          ),
          Positioned(
            top: 25,
            left: 25,
            right: 50,
            child: isSearchActive == true ? Divider() : Text(''),
          ),
          Positioned(
            top: 35,
            left: 25,
            right: 25,
            child: Container(
                height: 20,
                width: wt,
                child: Text(
                  filter,
                  style: fontStyle(9, Colors.grey),
                )),
          ),
          isSearchActive == true
              ? Positioned(
                  top: 55,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'service charges';
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.home_repair_service_sharp,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'home repair services';
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.trending_up,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'trending';
                              });
                            }),
                        CircleAvatar(
                          backgroundColor: Colors.amber[50],
                          radius: 18,
                          child: IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 18,
                              ),
                              onPressed: () {
                                setState(() {
                                  filter = '';
                                  isSearchActive = false;
                                });
                              }),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.local_hospital,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'health services';
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.hourglass_bottom,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'estimated time-duration';
                              });
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.home_work,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                filter = 'home and office services';
                              });
                            }),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  buildTabBar() {
    return Container(
      height: 25,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 25),
      child: DefaultTabController(
          length: 5,
          child: TabBar(
            labelPadding: EdgeInsets.all(0),
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: true,
            labelStyle: fontStyle(14, Colors.black, FontWeight.w700),
            unselectedLabelColor: Colors.grey[400],
            unselectedLabelStyle: fontStyle(12, Colors.grey, FontWeight.w500),
            indicator: UnderlineTabIndicator(
              insets: EdgeInsets.only(
                right: 20,
              ),
              borderSide: BorderSide(width: 2, color: Colors.amber),
            ),
            tabs: [
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Daily'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Trending'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Health'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Repair & Maintenance'),
                ),
              ),
              Tab(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text('Recents'),
                ),
              ),
            ],
          )),
    );
  }
}
