import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileModal {
  String id;
  String name;
  String profileimg;
  String youtube;
  String linkdin;
  String location;
  String creditcard;
  String cardcvv;
  String cardpin;
  String cardexpirydate;
  String dailycharge;
  String occupation;

  ProfileModal({
    this.id,
    this.name,
    this.profileimg,
    this.youtube,
    this.linkdin,
    this.location,
    this.creditcard,
    this.cardcvv,
    this.cardpin,
    this.cardexpirydate,
    this.dailycharge,
    this.occupation,
  });

  ProfileModal.fromJson(Map<String, dynamic> json) {
    print("jason" + json.toString());
    id = json['_id'];
    name = json['name'];
    profileimg = json['profileimg'];
    youtube = json['youtube'];
    linkdin = json['linkdin'];
    location = json['location'];
    creditcard = json['creditcard'];
    cardcvv = json['cardcvv'];
    cardpin = json['cardpin'];
    cardexpirydate = json['cardexpirydate'];
    dailycharge = json['dailycharge'];
    occupation = json['occupation'] == null ? '' : json['occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['_id'] = this.id;
    json['name'] = this.name;
    json['profileimg'] = this.profileimg;
    json['youtube'] = this.youtube;
    json['linkdin'] = this.linkdin;
    json['location'] = this.location;
    json['creditcard'] = this.creditcard;
    json['cardcvv'] = this.cardcvv;
    json['cardpin'] = this.cardpin;
    json['cardexpirydate'] = this.cardexpirydate;
    json['dailycharge'] = this.dailycharge;
    json['occupation'] = this.occupation;
    return json;
  }
}

class ProfileApi with ChangeNotifier {
  Future<ProfileModal> getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    final response = await http.post('${api}getprofile',
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "userid": userId,
        }));
    Map<dynamic, dynamic> mapProfile = json.decode(response.body);
    print(mapProfile);
    final objProfileModal = ProfileModal.fromJson(mapProfile['data']);
    print("Profile NAme" + objProfileModal.name);
    if (mapProfile.containsKey('err')) {
      print(mapProfile['err']);
      throw mapProfile['err'];
    } else {
      if (response.statusCode == 200) {
        print(mapProfile['data']);
        return objProfileModal;
      } else {
        throw "Fail To Load";
      }
    }
  }

  Future<void> updateProWithimg(
    String name,
    String ytLink,
    String lkdinLink,
    String location,
    File image,
    String creditcard,
    String occupation,
    String cvv,
    String pin,
    String date,
    String dailyCharge,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    final bytes = File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    print(img64);
    final response = await http.post(
      '${api}updateprofile',
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "userid": userId,
        "profileimg": img64,
        "name": name,
        "youtube": ytLink,
        "linkdin": lkdinLink,
        "location": location,
        "creditcard": creditcard,
        "occupation": occupation,
        "cardcvv": cvv,
        "cardpin": pin,
        "cardexpirydate": date,
        "dailycharge": dailyCharge,
      },
    );
    Map<dynamic, dynamic> map = json.decode(response.body);
    print(map);
    if (map.containsKey('err')) {
      print("Error Occured");
      print(map['err']);
      throw map['err'];
    } else {
      if (response.statusCode == 200) {
        print(map['data']);
      } else {
        throw "Fail to load";
      }
    }
  }

  Future<void> updatePro(
    String name,
    String ytLink,
    String lkdinLink,
    String location,
    String creditcard,
    String occupation,
    String cvv,
    String pin,
    String date,
    String dailyCharge,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final api = sharedPreferences.getString('api');
    final userId = sharedPreferences.getString('userid');
    print(name);
    print(ytLink);
    print(lkdinLink);
    print(location);
    print(creditcard);
    print(occupation);
    print(cvv);
    print(pin);
    print(date);
    print(dailyCharge);

    final response = await http.post(
      '${api}updateprofile',
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "userid": userId,
        "name": name,
        "youtube": ytLink,
        "linkdin": lkdinLink,
        "location": location,
        "creditcard": creditcard,
        "occupation": occupation,
        "cardcvv": cvv,
        "cardpin": pin,
        "cardexpirydate": date,
        "dailycharge": dailyCharge
      },
    );
    Map<dynamic, dynamic> map = json.decode(response.body);
    print(map);
    if (map.containsKey('err')) {
      print("Error Occured");
      print(map['err']);
      throw map['err'];
    } else {
      if (response.statusCode == 200) {
        print(map['data']);
        sharedPreferences.setString('name', name);
      } else {
        throw "Fail to load";
      }
    }
  }
}
