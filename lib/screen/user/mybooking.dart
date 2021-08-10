// import 'dart:developer';

// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:glodgeapp/network_utils/api.dart';

// import 'package:glodgeapp/screen/dashboard.dart'

class MyBooking extends StatefulWidget {
  // const MyBooking({Key? key}) : super(key: key);
  final String BookingData;
  const MyBooking({Key key, this.BookingData}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  // bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var data = widget.BookingData;
    print('Widget.bookingData');
    print(data);
    var booking = jsonDecode(data);
    print('Json Decode booking Data');
    print(booking['myBooking'][0]['order_id']);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyBookings'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: booking['myBooking'].length,
          itemBuilder: (BuildContext context, int index) {
            Color statusColor = Colors.blue;
            Color approve = Colors.teal;
            Color cancel = Colors.red;
            if (booking['myBooking'][index]['payment_status'] == 'Approved') {
              statusColor = approve;
            } else {
              statusColor = cancel;
            }
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              padding: EdgeInsets.only(top: 8.0),
              child: Card(
                elevation: 10.0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${booking['myBooking'][index]['room_no']} - "
                            "${booking['myBooking'][index]['room_type']}",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Booking ID: ${booking['myBooking'][index]['order_id']}",

                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                            // textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text(
                            "${booking['myBooking'][index]['lodge_name']}",
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       'Room Facilities',
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ],
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(''),
                    //     ),
                    //     Icon(Icons.airline_seat_individual_suite_outlined),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Single Bed: '),
                    //     ),
                    //     SizedBox(height: 10),
                    //     Icon(Icons.airline_seat_individual_suite_rounded),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Double Bed: '),
                    //     ),
                    //   ],
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(''),
                    //     ),
                    //     Icon(Icons.bathtub_outlined),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Toilet: '),
                    //     ),
                    //     SizedBox(height: 10),
                    //     Icon(Icons.bathtub),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Bathroom: '),
                    //     ),
                    //   ],
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(''),
                    //     ),
                    //     Icon(Icons.airplay_rounded),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('TV: '),
                    //     ),
                    //     SizedBox(height: 10),
                    //     Icon(Icons.wifi),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Wifi: '),
                    //     ),
                    //   ],
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 5.0),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Expanded(
                    //       flex: 1,
                    //       child: Text(''),
                    //     ),
                    //     Icon(Icons.filter_alt_rounded),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('Geyser: '),
                    //     ),
                    //     SizedBox(height: 10),
                    //     Icon(Icons.cloud_download_sharp),
                    //     Expanded(
                    //       flex: 4,
                    //       child: Text('AC: '),
                    //     ),
                    //   ],
                    // ),
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
                                "Name: ${booking['myBooking'][index]['booked_by']}")),
                        SizedBox(height: 10),
                        // Icon(Icons.airline_seat_individual_suite_outlined),
                        Expanded(
                          flex: 2,
                          child: Text(
                              'Age: ${booking['myBooking'][index]['age']}'),
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
                          child: Text(
                              'Gender: ${booking['myBooking'][index]['gender']}'),
                        ),
                        SizedBox(height: 10),
                        // Icon(Icons.bathtub),
                        Expanded(
                          flex: 4,
                          child: Text(
                              'Mobile: ${booking['myBooking'][index]['mobile']}'),
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
                              'Checkin: ${booking['myBooking'][index]['checkin']}'),
                        ),
                        SizedBox(height: 10),
                        // Icon(Icons.wifi),
                        Expanded(
                          flex: 4,
                          child: Text(
                              'Checkout: ${booking['myBooking'][index]['checkout']}'),
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
                            'No. of Guest: ${booking['myBooking'][index]['no_of_guest']}'),
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
                          child:
                              Text('${booking['myBooking'][index]['address']}'),
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
                            '\u{20B9}${booking['myBooking'][index]['amount']} ',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              'Booking Status: ${booking['myBooking'][index]['payment_status']}',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: statusColor,
                              ),
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
                          flex: 9,
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '(Note: Paid amount may be different as shown here.)',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
