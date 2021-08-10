import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:glodgeapp/screen/dashboard.dart';
import 'package:glodgeapp/screen/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class BookingConfirmation extends StatefulWidget {
  // const BookingConfirmation({Key? key}) : super(key: key);
  final String data;
  final String room;
  BookingConfirmation({Key key, this.data, this.room}) : super(key: key);

  @override
  _BookingConfirmationState createState() => _BookingConfirmationState();
}

class _BookingConfirmationState extends State<BookingConfirmation> {
  // String name;
  // String username;
  // _loadUserData() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var user = jsonDecode(localStorage.getString('user'));
  //   if (user != null) {
  //     setState(() {
  //       name = user['name'];
  //       username = user['email'];
  //       // print(username);
  //     });
  //   }
  // }
  Future<bool> _onWillPop() async {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Home()));
    // return (await showDialog(
    //       context: context,
    //       builder: (context) => new AlertDialog(
    //         title: new Text('Are you sure?'),
    //         content: new Text('Do you want to exit an App'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pop(false),
    //             child: new Text('No'),
    //           ),
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pop(true),
    //             child: new Text('Yes'),
    //           ),
    //         ],
    //       ),
    //     )) ??
    //     false;
  }

  @override
  Widget build(BuildContext context) {
    var book = widget.data;
    var booking = jsonDecode(book);
    var rm = widget.room;
    var room = jsonDecode(rm);
    // print('room details');
    // print(room);
    // print('Booking Confirmation');
    // print(booking);
    // print(booking['bookingData']['order_id']);
    // print(booking['bookingData']['single_bed']);
    // print(booking['bookingData']['double_bed']);
    // print(booking['bookingData']['order_id']);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Booking Confirmation'),
          backgroundColor: Colors.teal,
        ),
        // drawer: Dashboard(name: name, username: username),
        body: ListView(
          children: <Widget>[
            Card(
              elevation: 10.0,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${booking['bookingData']['room_no']} - "
                          "${booking['bookingData']['room_type']}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Booking ID: ${booking['bookingData']['order_id']}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          "${booking['bookingData']['lodge_name']}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // here we have to put original images
                  Image.asset(
                    'asset/images/hotel3.jpg',
                    // height: 150,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' Room Facilities ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            // backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      Icon(Icons.airline_seat_individual_suite_outlined),
                      Expanded(
                        flex: 4,
                        child: Text('Single Bed: ${room['single_bed']}'),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.airline_seat_individual_suite_rounded),
                      Expanded(
                        flex: 4,
                        child: Text('Double Bed: ${room['double_bed']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      Icon(Icons.bathtub_outlined),
                      Expanded(
                        flex: 4,
                        child: Text('Toilet: ${room['toilet']}'),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.bathtub),
                      Expanded(
                        flex: 4,
                        child: Text('Bathroom: ${room['bathroom']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      Icon(Icons.airplay_rounded),
                      Expanded(
                        flex: 4,
                        child: Text('TV: ${room['tv']}'),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.wifi),
                      Expanded(
                        flex: 4,
                        child: Text('Wifi: ${room['wifi']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      Icon(Icons.filter_alt_rounded),
                      Expanded(
                        flex: 4,
                        child: Text('Geyser: ${room['geyser']}'),
                      ),
                      SizedBox(height: 10),
                      Icon(Icons.cloud_download_sharp),
                      Expanded(
                        flex: 4,
                        child: Text('AC: ${room['ac']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' Booking Detail ',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            // backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      // Icon(Icons.airline_seat_individual_suite_outlined),
                      Expanded(
                          flex: 6,
                          child: Text(
                              "Name: ${booking['bookingData']['booked_by']}")),
                      SizedBox(height: 10),
                      // Icon(Icons.airline_seat_individual_suite_outlined),
                      Expanded(
                        flex: 2,
                        child: Text('Age: ${booking['bookingData']['age']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      // Icon(Icons.bathtub_outlined),
                      Expanded(
                        flex: 4,
                        child:
                            Text('Gender: ${booking['bookingData']['gender']}'),
                      ),
                      SizedBox(height: 10),
                      // Icon(Icons.bathtub),
                      Expanded(
                        flex: 4,
                        child:
                            Text('Mobile: ${booking['bookingData']['mobile']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      // Icon(Icons.airplay_rounded),
                      Expanded(
                        flex: 4,
                        child: Text(
                            'Checkin: ${booking['bookingData']['checkin']}'),
                      ),
                      SizedBox(height: 10),
                      // Icon(Icons.wifi),
                      Expanded(
                        flex: 4,
                        child: Text(
                            'checkout: ${booking['bookingData']['checkout']}'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'No. of Guest: ${booking['bookingData']['no_of_guest']}'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      // Icon(Icons.airplay_rounded),
                      Expanded(
                        flex: 2,
                        child: Text('Address: '),
                      ),

                      Expanded(
                        flex: 7,
                        child: Text('${booking['bookingData']['address']}'),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(''),
                      ),
                      // Icon(Icons.airplay_rounded),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '\u{20B9}${booking['bookingData']['amount']} ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 5,
                        child: Text(
                          'Booking Status: ${booking['bookingData']['payment_status']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(' '),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '(Per room per night) ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(' '),
                      ),
                      Expanded(
                        flex: 8,
                        child: Text(
                          '(Note: Paid amount may be different as shown here.)',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
