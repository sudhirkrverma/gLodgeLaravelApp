import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glodgeapp/network_utils/api.dart';
import 'package:glodgeapp/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glodgeapp/screen/register.dart';
import 'package:glodgeapp/screen/privacypolicy.dart';

class Login extends StatefulWidget {
  // const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  var email;
  var password;
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.teal,
      body: ListView(
        padding: EdgeInsets.only(top: 100.0),
        children: <Widget>[
          // color: Colors.teal,
          // child:
          Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "asset/ashok.png",
                            height: 100,
                          ),
                          Text(
                            'Government Lodge Management System\nDistrict East Siang\nArunachal Pradesh',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Card(
                        elevation: 4.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 20, right: 20),
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
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  validator: (emailValue) {
                                    if (emailValue.isEmpty) {
                                      return 'Please enter email';
                                    } else if (!emailValue.contains('@')) {
                                      return 'Please enter valid email';
                                    } else if (emailValue.contains(' ')) {
                                      return 'Please avoid space in email';
                                    }
                                    email = emailValue;
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.vpn_key,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  validator: (passwordValue) {
                                    if (passwordValue.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    password = passwordValue;
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
                                        _isLoading ? 'Processing...' : 'Login',
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
                                          new BorderRadius.circular(20.0),
                                    ),
                                    onPressed: () {
                                      // print("Ready to login");
                                      if (_formKey.currentState.validate()) {
                                        _login();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Register()));
                          },

                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Register now!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Text(
                          //   'Create new Account',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 15.0,
                          //     decoration: TextDecoration.underline,
                          //     fontWeight: FontWeight.normal,
                          //   ),
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy()));
                          },
                          child: Text(
                            '@Content owned by District Administration',
                            style: TextStyle(
                              color: Colors.white,
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
        ],
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password,
    };
    // print(data);

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    print("Response Data:");
    print(body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['access_token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      _showMsg(body['message']);
    }
    setState(() {
      _isLoading = false;
    });
  }
}
