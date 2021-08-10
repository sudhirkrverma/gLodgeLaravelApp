import 'dart:convert';

import 'package:flutter/material.dart';

// import 'dart:convert';

import 'package:glodgeapp/screen/login.dart';
import 'package:glodgeapp/network_utils/api.dart';
import 'package:glodgeapp/screen/user/bookingstatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:glodgeapp/screen/user/mybooking.dart';
import 'package:glodgeapp/screen/user/roomSearch.dart';
import 'package:glodgeapp/screen/user/about.dart';
import 'package:glodgeapp/screen/user/tourism.dart';
import 'package:glodgeapp/screen/user/contact.dart';

class Dashboard extends StatelessWidget {
  final String name;
  final String username;

  Dashboard({Key key, this.name, this.username}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some Code to undo the change
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    void mybookingData() async {
      print('These are all the boooking data');
      var res = await Network().getData('/mybookings');

      var body = jsonDecode(res.body);

      if (body['success']) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyBooking(
                  BookingData: res.body,
                )));
      } else {
        _showMsg(body['message']);
        // _showMsg('No Booking Found');
      }
    }

    void contact() async {
      var res = await Network().getData('/contact');
      var body = jsonDecode(res.body);

      if (body['success']) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Contact(data: res.body)));
      } else {
        _showMsg(body['message']);
      }
    }

    void logout() async {
      var res = await Network().getData('/logout');
      var body = jsonDecode(res.body);

      print(body);
      print(res.body);
      // body['success'] = true;
      if (body['success']) {
        print("Successfully Logout ");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.remove('user');
        localStorage.remove('token');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        _showMsg(body['message']);
        print('Forcefully Logout');
        SharedPreferences localStorage = await SharedPreferences.getInstance();

        localStorage.remove('user');
        localStorage.remove('token');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: new SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    width: 800.0,
                    child: Container(
                      width: 300.0,
                      color: Colors.teal[300],
                      child: DrawerHeader(
                        child: ListView(
                          children: <Widget>[
                            Text(
                              "Hi, $name ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            CircleAvatar(
                              child: new Image.asset("asset/icon/glodge.png"),
                              radius: 40.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0),
                            ),
                            Text(
                              "Welcome to gLodge",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    mybookingData();
                  },
                  leading: Icon(Icons.home),
                  title: Text(
                    "My Bookings",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RoomSearch(username: username),
                    ));
                  },
                  leading: Icon(Icons.hotel_sharp),
                  title: Text(
                    "Book Your Room",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookingStatus()));
                  },
                  leading: Icon(Icons.book_online),
                  title: Text(
                    "Booking Status/Cancel",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Tourism(),
                    ));
                  },
                  leading: Icon(Icons.image_search),
                  title: Text(
                    "Tourism",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => About(),
                    ));
                  },
                  leading: Icon(Icons.info_rounded),
                  title: Text(
                    "About District",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    contact();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => changepassword(username: username),
                    // ));
                  },
                  leading: Icon(Icons.contact_phone_rounded),
                  title: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    logout();
                  },
                  leading: Icon(Icons.logout),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_back_ios_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
