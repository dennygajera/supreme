import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/slider/slidericon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BottomUpSliderProvider with ChangeNotifier {
  List<SliderIcon> _items = [
    // SliderIcon(title: 'Electronics', image: 'assets/icons/makemytrip.png'),
    // SliderIcon(title: 'Electronics', image: 'assets/icons/booking.png'),
    // SliderIcon(title: 'Electronics', image: 'assets/icons/oyo.png'),
    // SliderIcon(title: 'Electronics', image: 'assets/icons/Goibibo.png'),
    // SliderIcon(title: 'Electronics', image: 'assets/icons/Expedia.png'),
  ];
  List<SliderIcon> get items {
    return [..._items];
  }

  Future<void> setIcon() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    // final userId = sharedPreferences.getString('userid');
    try {
      final response = await http.post(
        '${api}companyandservicelist',
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "type": 0,
          },
        ),
      );
      Map<String, dynamic> map = json.decode(response.body);

      if (response.body.contains("err")) {
        final err = map['err'];
        print(err);
        throw map['err'];
      } else {
        if (response.statusCode == 200) {
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
        } else {
          throw Exception("fail to load");
        }
      }
    } catch (error) {
      print("Error");

      print(error);
    }
  }
}
