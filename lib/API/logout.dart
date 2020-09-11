import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOut with ChangeNotifier {
  Future<void> logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('login', false);
    sharedPreferences.setString('name', '');
    sharedPreferences.setString('email', '');
    print(sharedPreferences.getBool('login'));
  }
}
