import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/slider/slidericon.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LeftSideSliderIconProvider with ChangeNotifier {
  List<SliderIcon> _items = [
    // SliderIcon(title: 'gym', image: 'assets/icons/gym.png'),
    // SliderIcon(title: 'retaurant', image: 'assets/icons/retaurant.png'),
    // SliderIcon(title: 'Hotels', image: 'assets/icons/Hotels.png'),
  ];
  List<SliderIcon> get items {
    return [..._items];
  }

  List<SliderIcon> _images = [
    SliderIcon(title: 'Electronics', image: 'assets/icons/AddProject.png'),
    SliderIcon(title: 'Electronics', image: 'assets/icons/read.png'),
    SliderIcon(title: 'Electronics', image: 'assets/icons/add.png'),
    SliderIcon(title: 'Electronics', image: 'assets/icons/Hired.png'),
    SliderIcon(title: 'Electronics', image: 'assets/icons/AddProject.png'),
  ];
  List<SliderIcon> get images {
    return [..._images];
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
      for (var i = (list.length / 2).round(); i < list.length; i++) {
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
