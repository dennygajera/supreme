import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VerPinApi with ChangeNotifier {
  Future<int> verPin(int pin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    print("Amit");
    final response = await http.post(
      "${api}verifypin",
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
    if (map.containsKey("err")) {
      print(map['err']);
      throw map['err'];
    } else {
      if (response.statusCode == 200) {
        sharedPreferences.setInt('pinstatus', 1);
        print(map['data']);
      } else {
        throw "Failed to load";
      }
    }
    return response.statusCode;
  }
}
