import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glodgeapp/screen/user/bookingConfirmation.dart';
import 'package:glodgeapp/screen/user/roomSearch.dart';
import 'package:glodgeapp/network_utils/api.dart';

class BookingRoom extends StatefulWidget {
  // const BookingRoom({Key? key}) : super(key: key);
  final String userdata;
  final String roomdata;
  BookingRoom({Key key, this.userdata, this.roomdata}) : super(key: key);

  @override
  _BookingRoomState createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  var name;
  var age;
  var phone;
  var address;
  var district;
  var genderList = ['Male', 'Female', 'Others'];
  var gender = 'Male';
  var stateList = [
    'Andaman and Nicobar',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghayala',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Pondicherry',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Tripura',
    'UT of DNH and DD',
    'Uttarakhand',
    'Uttar Pradesh',
    'West Bengal',
    'Others'
  ];
  var stateName = 'Arunachal Pradesh';
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

  void roomBooking() async {
    setState(() {
      _isLoading = true;
    });
    // Here we first consider all the required data
    // var userData = {
    //   'name': name,
    //   'age': age,
    //   'gender': gender,
    //   'phone': phone,
    //   'address': address,
    //   'district': district,
    //   'state': stateName,
    // };
    // print('Booking Data');
    // print(userData);
    // print('User Data like checkin checkout number of person');
    var bookingData = widget.userdata;
    // print(jsonDecode(user));
    var booking = jsonDecode(bookingData);

    // print('room data');
    var roomData = widget.roomdata;
    var room = jsonDecode(roomData);

    // print(jsonDecode(room));
    var data = {
      'username': booking['username'],
      'name': name,
      'age': age,
      'gender': gender,
      'mobile': phone,
      'address': address,
      'district': district,
      'state': stateName,
      'room_no': room['room_no'],
      'room_type': room['room_type'],
      'room_image': room['img1'],
      'lodge_id': room['lodge_id'],
      'lodge_name': room['lodge_name'],
      'checkin': booking['checkin'],
      'checkout': booking['checkout'],
      'noOfRoom': 1,
      'adult': booking['adult'],
      'children': booking['child'],
      'amount': room['price']
    };

    print('Final Data Transfer:');
    print(data);

    var res = await Network().getBookingData(data, '/booking_room');
    var body = jsonDecode(res.body);
    print('Response');
    if (body['success']) {
      // Here we set naviagtion
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              BookingConfirmation(data: res.body, room: roomData)));
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Booking Room details');
    var rmd = widget.roomdata;
    var room = jsonDecode(rmd);
    // var userdata = jsonDecode(ud);
    print('room data:');
    print(room);

    print('User Data');
    var ud = widget.userdata;
    var user = jsonDecode(ud);
    print(user);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Enter Your Details'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
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
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                    ),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_box_outlined,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (nameValue) {
                                      if (nameValue.isEmpty) {
                                        return 'Please enter your Name';
                                      } else if (nameValue.contains('  ')) {
                                        return 'Please avoid unnecessary space';
                                      } else if (nameValue.length > 24) {
                                        return 'Name can be only 24 character long.';
                                      }
                                      name = nameValue;
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                    ),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.format_list_numbered_outlined,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Age",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (ageValue) {
                                      if (ageValue.isEmpty) {
                                        return 'Please enter age';
                                      } else if (int.parse(ageValue) > 100 ||
                                          int.parse(ageValue) < 1) {
                                        return 'Please enter age between 1 to 100 yrs';
                                      }
                                      age = ageValue;
                                      return null;
                                    },
                                  ),
                                  FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          // labelText: 'Adult',
                                          prefixIcon: Icon(
                                            Icons.select_all_rounded,
                                            color: Colors.grey,
                                          ),
                                          labelStyle: TextStyle(),
                                          errorStyle: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0,
                                          ),
                                          hintText: 'Please select gender',
                                        ),
                                        isEmpty: gender == '',
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              value: gender,
                                              isDense: true,
                                              onChanged: (String newValue) {
                                                setState(() {
                                                  gender = newValue;

                                                  state.didChange(newValue);
                                                });
                                              },
                                              items: genderList
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList()),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5.0)),
                                  TextFormField(
                                    style: TextStyle(color: Color(0xFF000000)),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Phone",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    validator: (phonenumber) {
                                      if (phonenumber.isEmpty) {
                                        return 'Please enter phone number';
                                      } else if (phonenumber.length != 10) {
                                        return 'Please enter valid 10 digit phone number';
                                      }
                                      phone = phonenumber;
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                    ),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Address",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (addressValue) {
                                      if (addressValue.isEmpty) {
                                        return 'Please enter your address';
                                      } else if (addressValue.contains('  ')) {
                                        return 'Please avoid unnecessary space';
                                      }
                                      address = addressValue;
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                    ),
                                    cursorColor: Color(0xFF9b9b9b),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.bookmark_border_outlined,
                                        color: Colors.grey,
                                      ),
                                      hintText: "District",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    validator: (districtValue) {
                                      if (districtValue.isEmpty) {
                                        return 'Please enter your District';
                                      } else if (districtValue.contains('  ')) {
                                        return 'Please avoid unnecessary space';
                                      }
                                      district = districtValue;
                                      return null;
                                    },
                                  ),
                                  FormField<String>(
                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          // labelText: 'Adult',
                                          prefixIcon: Icon(
                                            Icons.bookmark_border_outlined,
                                            color: Colors.grey,
                                          ),
                                          labelStyle: TextStyle(),
                                          errorStyle: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 16.0,
                                          ),
                                          hintText: 'Please select your State',
                                          // border: OutlineInputBorder(
                                          //   borderRadius:
                                          //       BorderRadius.circular(20.0),
                                          // ),
                                        ),
                                        isEmpty: stateName == '',
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              value: stateName,
                                              isDense: true,
                                              onChanged: (String newValue) {
                                                setState(() {
                                                  stateName = newValue;

                                                  state.didChange(newValue);
                                                });
                                              },
                                              items:
                                                  stateList.map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList()),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FlatButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8,
                                            top: 8,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          _isLoading
                                              ? 'Processing...please wait'
                                              : 'Continue to Book',
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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          roomBooking();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => RoomSearch()));
                            },
                            child: Text(
                              'Modify your booking',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15.0,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
