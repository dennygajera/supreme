import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CityList with ChangeNotifier {
  List<City> _items = [
    City(cityName: "Surat"),
    City(cityName: "bhavanagar"),
    City(cityName: "Mumbai"),
    City(cityName: "Delhi"),
    City(cityName: "Surat"),
    City(cityName: "bhavanagar"),
    City(cityName: "Mumbai"),
    City(cityName: "Delhi"),
  ];
  List<City> get items {
    return [..._items];
  }

  Future<void> fetchCity() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    try {
      final response = await http.post(
        '${api}citylist',
        headers: {"Content-Type": "application/json"},
        body: json.encode(
          {
            "userid": userId,
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
          List<City> loadedList = [];
          // print(list);
          for (var i = 0; i < list.length; i++) {
            loadedList.add(City(
              cityName: '${list[i]['name']}',
            ));
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

class City {
  final String cityName;
  City({@required this.cityName});
}
