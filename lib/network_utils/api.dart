import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  // final String _url = 'http://10.0.2.2:8000/api';
  final String _url = 'http://10.176.136.35/glodge/public/api';
  // final String _url = 'http://10.201.45.35/glodge/public/api';

  //if you are using android studio emulator, change localhost- 10.0.2.2

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // token = jsonDecode(localStorage.getString('token'))['access_token'];
    token = jsonDecode(localStorage.getString('token'));
    // token = localStorage.getString('token');

    print(token);
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);

    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  getBookingData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  cancelBookingRequest(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    await _getToken();
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
