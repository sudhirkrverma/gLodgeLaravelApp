import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:glodgeapp/screen/login.dart';
// import 'package:glodgeapp/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glodgeapp/screen/dashboard.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name;
  String username;
  // bool _isLoading = false;
  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    if (user != null) {
      setState(() {
        name = user['name'];
        username = user['email'];
        // print(username);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to gLodge'),
        backgroundColor: Colors.teal,
      ),
      drawer: Dashboard(name: name, username: username),
      body: ListView(
        children: <Widget>[
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "asset/ashok.png",
                  // "asset/images/hotel2.jpg",
                  // width: 300,
                  height: 75,
                ),
                Padding(
                  padding: const EdgeInsets.all(.0),
                  child: Text(
                    'Government Lodge Management System\nDistrict East Siang\nArunachal Pradesh',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://source.unsplash.com/450x250/?food'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://source.unsplash.com/450x250/?hotel'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://source.unsplash.com/450x250/?nature'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            // Slider Container properties
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Container(
                  child: Text(
                    'Avaiable Facilities',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Text(
                //   'Hi, $name',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Card(
                  elevation: 7.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   // "asset/ashok.png",
                      //   "asset/images/hotel2.jpg",
                      //   // width: 300,
                      //   height: 180,
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Luxury Rooms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'The Super Deluxe Room is a one-room suite with queen-size bed and comfortable seating area. It has a 39-inch flat screen TV and electric fireplace. There is attached neat and clean washroom to every room.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            // fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Card(
                  elevation: 7.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   // "asset/ashok.png",
                      //   "asset/images/hotel2.jpg",
                      //   // width: 300,
                      //   height: 180,
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Conference Room',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Conference Room has the capacity to sit around 50 (fifty) people at one place. It has Projector Screen, Fully Air conditioner and very well organise for conducting the administrative meetings, conference.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Card(
                  elevation: 7.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Image.asset(
                      //   // "asset/ashok.png",
                      //   "asset/images/hotel2.jpg",
                      //   // width: 300,
                      //   height: 180,
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Food',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'The traditional food of India has been widely appreciated for its fabulous use of herbs and spices. region to region and is largely divided into South Indian & North Indian cuisine. Here You will get vast variety of food and fruits.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                // Center(
                //   child: RaisedButton(
                //     elevation: 10,
                //     onPressed: () {
                //       // print("Going to Logout");
                //       // logout();
                //     },
                //     color: Colors.teal,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10))),
                //     child: Text(
                //       _isLoading ? 'Processing..' : 'Logout',
                //       style: TextStyle(
                //         fontSize: 15.0,
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void logout() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var res = await Network().getData('/logout');
  //   var body = jsonDecode(res.body);

  //   print(body);

  //   if (body['success']) {
  //     print("Successfully Logout ");
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.remove('user');
  //     localStorage.remove('token');
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  //   } else {
  //     print('Forcefully Logout');
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();

  //     localStorage.remove('user');
  //     localStorage.remove('token');
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  //   }
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }
}
