import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glodgeapp/screen/user/bookNow.dart';
import 'package:glodgeapp/network_utils/api.dart';

class RoomSearch extends StatefulWidget {
  // const RoomSearch({ Key? key }) : super(key: key);
  final String username;
  RoomSearch({Key key, this.username}) : super(key: key);

  @override
  _RoomSearchState createState() => _RoomSearchState();
}

class _RoomSearchState extends State<RoomSearch> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var adult;
  var children;
  var childList = ['0', '1'];
  var adultList = ['1', '2'];
  var _currentSelectedChild = '0';
  var _currentSelectedAdult = '1';
  DateTime selectedDate = DateTime.now();
  TextEditingController checkin = TextEditingController();
  TextEditingController checkout = TextEditingController();

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

  Future<void> _checkinDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _checkoutDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void initState() {
    super.initState();
    checkin = new TextEditingController();
    checkout = new TextEditingController();
  }

  void roomSearch() async {
    setState(() {
      _isLoading = true;
    });
    var username = widget.username;
    var data = {
      'checkin': checkin.text,
      'checkout': checkout.text,
      'adult': _currentSelectedAdult,
      'child': _currentSelectedChild,
      'username': username,
    };
    print(data);

    // Now here we send the data to laravel using post method
    var res = await Network().getData('/room_search?checkin=' +
        data['checkin'] +
        '&checkout=' +
        data['checkout'] +
        '&adult=' +
        data['adult'] +
        '&children=' +
        data['child']);
    var body = jsonDecode(res.body);
    print(res.body);
    if (body['success']) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              BookNow(data: res.body, userdata: jsonEncode(data))));
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Room Search'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: ListView(
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
                        readOnly: true,
                        // keyboardType: TextInputType.text,
                        onTap: () async {
                          await _checkinDate(context);
                          checkin.text = selectedDate.toString().split(' ')[0];
                        },
                        controller: checkin,
                        decoration: InputDecoration(
                          labelText: 'Checkin',
                          prefixIcon: Icon(
                            Icons.calendar_today_sharp,
                            color: Colors.grey,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: "Checkin",
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        validator: (checkindate) {
                          if (checkindate.isEmpty) {
                            return 'Please enter Checkin';
                          }
                          // checkin = checkindate;
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      TextFormField(
                        style: TextStyle(color: Color(0xFF000000)),
                        cursorColor: Color(0xFF9b9b9b),
                        // keyboardType: TextInputType.text,
                        readOnly: true,

                        onTap: () async {
                          await _checkoutDate(context);
                          checkout.text = selectedDate.toString().split(' ')[0];
                        },
                        controller: checkout,
                        decoration: InputDecoration(
                          labelText: 'Checkout',
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                          hintText: "Checkout",
                          hintStyle: TextStyle(
                            color: Color(0xFF9b9b9b),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        validator: (checkoutValue) {
                          if (checkoutValue.isEmpty) {
                            return 'Please enter checkout';
                          }
                          // checkout = checkoutValue;
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Adult',
                                prefixIcon: Icon(
                                  Icons.person_add,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(),
                                errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16.0,
                                ),
                                hintText: 'Please add atleast one person',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            isEmpty: _currentSelectedAdult == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: _currentSelectedAdult,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _currentSelectedAdult = newValue;

                                      state.didChange(newValue);
                                    });
                                  },
                                  items: adultList.map((String value) {
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
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: 'Add Child',
                                prefixIcon: Icon(
                                  Icons.person_add,
                                  color: Colors.grey,
                                ),
                                labelStyle: TextStyle(),
                                errorStyle: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16.0,
                                ),
                                hintText: 'Please Select Child',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            isEmpty: _currentSelectedChild == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: _currentSelectedChild,
                                  isDense: true,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _currentSelectedChild = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: childList.map((String value) {
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
                              top: 8,
                              bottom: 8,
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              _isLoading ? 'Processing...' : 'Search Now',
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
                              roomSearch();
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
}
