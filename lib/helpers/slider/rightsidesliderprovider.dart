import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/slider/slidericon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RightSideSliderIconProvider with ChangeNotifier {
  List<SliderIcon> _items = [
    // SliderIcon(title: 'Electronics', image: 'assets/icons/Electronics.png'),
    // SliderIcon(title: 'Jewellary', image: 'assets/icons/Jewellary.png'),
    // SliderIcon(title: 'Clothes', image: 'assets/icons/Clothes.png'),
  ];
  List<SliderIcon> get items {
    return [..._items];
  }

  Future<void> setIcon() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    try {
      final response = await http.post(
        '${api}companyandservicelist',
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "userid": userId,
            "type": 1,
          },
        ),
      );
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list = map["data"];
      // print(list.length);
      List<SliderIcon> loadedList = [];

      for (var i = 0; i < list.length / 2; i++) {
        loadedList.add(
          SliderIcon(
              title: '${list[i]['name']}',
              image: 'assets/icons/${list[i]['image']}.png'),
        );
        // print(list[i]);
      }
      _items = loadedList;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
