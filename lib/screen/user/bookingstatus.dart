import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glodgeapp/network_utils/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingStatus extends StatefulWidget {
  // const BookingStatus({Key? key}) : super(key: key);

  @override
  _BookingStatusState createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextEditingController bookingid = TextEditingController();
  var bookingid;
  bool _isLoading = false;

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Booking Status'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Card(
              elevation: 4.0,
              color: Colors.white,
              margin: EdgeInsets.only(left: 10, right: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.book_online_outlined,
                            color: Colors.grey,
                          ),
                          hintText: "Booking ID",
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        validator: (bid) {
                          if (bid.isEmpty) {
                            return 'Please enter booking ID';
                          }
                          bookingid = bid;
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              _isLoading ? 'Processing...' : 'Submit',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          color: Colors.teal,
                          disabledColor: Colors.grey,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            // print("Ready to login");
                            if (_formKey.currentState.validate()) {
                              bookingStatus();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bookingStatus() async {
    setState(() {
      _isLoading = true;
    });
    print('Now we are going to get booking status');
    var res = await Network().getData('/mybookings/' + bookingid);
    var body = jsonDecode(res.body);
    if (body['success']) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Status(bookingData: res.body)));
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }
}

class Status extends StatefulWidget {
  // const Status({ Key? key }) : super(key: key);
  final String bookingData;
  Status({Key key, this.bookingData}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  bool _isLoading = false;
  // set state to show boooking status

  // var bookingStatus;
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

  void cancelBooking(id) async {
    setState(() {
      _isLoading = true;
    });
    print('Room ID:');
    print(id);
    var data = {
      'id': id,
    };

    var res = await Network().cancelBookingRequest(data, '/cancelBooking');
    var body = jsonDecode(res.body);

    print(body);
    if (body['success']) {
      // _showMsg(body['message']);
      Fluttertoast.showToast(
          msg:
              "Your booking request has been cancelled successfully. Kindly enter your booking id and check the status again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

      // Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BookingStatus()));
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.bookingData;
    var booking = jsonDecode(data);
    print('API Data');
    Color statusColor = Colors.blue;
    Color approve = Colors.teal;
    Color cancel = Colors.red;
    // print(booking);

    if (booking['status']['payment_status'] == 'Approved') {
      statusColor = approve;
    } else {
      statusColor = cancel;
    }

    // print(booking['status']['order_id']);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('BookingStatus'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 10.0,
            margin: EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${booking['status']['room_no']} - "
                        "${booking['status']['room_type']}",
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
                        "Booking ID: ${booking['status']['order_id']}" " ",
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
                        "${booking['status']['lodge_name']}",
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
                      child: Text("Name: ${booking['status']['booked_by']}"),
                    ),

                    // Icon(Icons.airline_seat_individual_suite_outlined),
                    Expanded(
                      flex: 2,
                      child: Text('Age: ${booking['status']['age']}'),
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
                      child: Text('Gender: ${booking['status']['gender']}'),
                    ),
                    SizedBox(height: 10),
                    // Icon(Icons.bathtub),
                    Expanded(
                      flex: 4,
                      child: Text('Mobile: ${booking['status']['mobile']}'),
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
                      child: Text('Checkin: ${booking['status']['checkin']}'),
                    ),
                    SizedBox(height: 10),
                    // Icon(Icons.wifi),
                    Expanded(
                      flex: 4,
                      child: Text('Checkout: ${booking['status']['checkout']}'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('No. of Guest: ${booking['status']['no_of_guest']}'),
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
                      child: Text('${booking['status']['address']}'),
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
                        '\u{20B9}${booking['status']['amount']} ',
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
                          'Booking Status: ${booking['status']['payment_status']}',
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
                      child: Text(
                        '(Note: Paid amount may be different as shown here.)',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              title: Text(
                                "Are you sure..do you wanna cancel your booking?",
                                textAlign: TextAlign.center,
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    cancelBooking(booking['status']['id']);
                                  },
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            );
                          });

                      //

                      // cancelBooking(booking['status']['id']);
                    },
                    child: Text(
                      _isLoading ? 'Processing..pls wait' : 'Cancel Booking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
