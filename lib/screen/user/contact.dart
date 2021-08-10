import 'dart:convert';

import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  // const Contact({Key? key}) : super(key: key);
  final String data;
  Contact({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = widget.data;
    var contact = jsonDecode(data);
    print(contact);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: contact['lodge'].length,
        itemBuilder: (BuildContext context, int index) {
          // print(contact['lodge'].length);
          // print(contact['lodge'][index]['lodge_name']);
          return SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),

                  Text(
                    "Guest House Name : ${contact['lodge'][index]['lodge_name']}",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "STD Code : 0368",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Phone : ${contact['lodge'][index]['receptionist_contact']}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Address : ${contact['lodge'][index]['address']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Email : ${contact['lodge'][index]['username']}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  // Here we have to original image of lodge
                  Image.network(
                      'https://source.unsplash.com/450x250/?hotel,room,food'),
                ],
              ),
            ),
          );
        },
      ),
      // Card(
      //   elevation: 10.0,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         '|| Contact ||',
      //         style: TextStyle(
      //           fontSize: 20.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Text('Government of Arunachal Pradesh'),
      //       Text('Government Lodge Management System'),
      //       Text(
      //         'Help Desk',
      //         style: TextStyle(
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       Text(
      //         'Office of Deputy Commissioner Complex, East Siang District, Pasighat, Arunachal Pradesh, INDIA',
      //       ),
      //       Text('Email:- dio-esg@nic.in'),
      //       Text('IP Phone:- 22246'),

      //     ],
      //   ),
      // ),
    );
  }
}
