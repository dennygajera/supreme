import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SetPinApi with ChangeNotifier {
  Future<int> setPin(int pin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    final response = await http.post(
      '${api}setpin',
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        {
          "userid": userId,
          "pin": pin,
        },
      ),
    );
    Map<dynamic, dynamic> map = json.decode(response.body);
    print(map);
    if (map.containsKey('err')) {
      print(map['err']);
      throw map['err'];
    } else {
      if (response.statusCode == 200) {
        print(map['data']);
        sharedPreferences.setInt("pinstatus", 1);
        sharedPreferences.setInt('setpinscreen', 0);
      } else {
        throw 'Failed To Load';
      }
    }
    return response.statusCode;
  }
}
