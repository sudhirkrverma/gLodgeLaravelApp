import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glodgeapp/screen/user/bookingRoom.dart';

class BookNow extends StatefulWidget {
  // const BookNow({ Key? key }) : super(key: key);
  final String data;
  final String userdata;
  BookNow({Key key, this.data, this.userdata}) : super(key: key);

  @override
  _BookNowState createState() => _BookNowState();
}

class _BookNowState extends State<BookNow> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    var room = jsonDecode(data);
    var ud = widget.userdata;
    var userdata = jsonDecode(ud);

    // print('user Details');
    // print(userdata);

    // print(userdata['checkin']);
    // print(room['room'][0]['room_no']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Now'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: room['room'].length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              padding: EdgeInsets.only(top: 10.0),
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
                            "${room['room'][index]['room_no']} - "
                            "${room['room'][index]['room_type']}",
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
                            " ${room['room'][index]['lodge_name']}",
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
                        Expanded(
                          flex: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Location: ${room['room'][index]['address']}",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                              ),
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
                            'Room Facilities',
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
                        Icon(Icons.airline_seat_individual_suite_outlined),
                        Expanded(
                          flex: 4,
                          child: Text(
                              "Single Bed: ${room['room'][index]['single_bed']}"),
                        ),
                        SizedBox(height: 10),
                        Icon(Icons.airline_seat_individual_suite_rounded),
                        Expanded(
                          flex: 4,
                          child: Text(
                              'Double Bed: ${room['room'][index]['double_bed']}'),
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
                          child:
                              Text('Toilet: ${room['room'][index]['toilet']}'),
                        ),
                        SizedBox(height: 10),
                        Icon(Icons.bathtub),
                        Expanded(
                          flex: 4,
                          child: Text(
                              'Bathroom: ${room['room'][index]['bathroom']}'),
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
                          child: Text('TV: ${room['room'][index]['tv']}'),
                        ),
                        SizedBox(height: 10),
                        Icon(Icons.wifi),
                        Expanded(
                          flex: 4,
                          child: Text('Wifi: ${room['room'][index]['wifi']}'),
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
                          child:
                              Text('Geyser: ${room['room'][index]['geyser']}'),
                        ),
                        SizedBox(height: 10),
                        Icon(Icons.cloud_download_sharp),
                        Expanded(
                          flex: 4,
                          child: Text('AC: ${room['room'][index]['ac']}'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '\u{20B9} ${room['room'][index]['price']} ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Per room per night)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    FlatButton(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 8, top: 8, left: 10, right: 10),
                        child: Text(
                          _isLoading ? 'Processing...' : 'Book Now',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      color: Colors.teal,
                      disabledColor: Colors.grey,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {
                        // Book Now
                        print(room['room'][index]);
                        print(ud);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookingRoom(
                                  roomdata: jsonEncode(room['room'][index]),
                                  userdata: jsonEncode(userdata),
                                )));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.0)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
