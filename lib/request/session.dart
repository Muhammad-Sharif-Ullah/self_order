import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static final Session _singleton = Session._internal();

  factory Session() {
    return _singleton;
  }

  Session._internal();

  static storeToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  static removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  // name
  static Future<String> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstname') ?? '';
  }

  static setName(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('name', name);
  }

  static removeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
  }

  // email
  static setEmail(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }

  static removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }
}
