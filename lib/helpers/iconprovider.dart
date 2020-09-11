import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/icons.dart';

class IconProvider with ChangeNotifier {
  List<Iconss> _items = [
    Iconss(
        icon: Icon(
      Icons.ac_unit,
      color: Colors.amber[200],
      size: 13,
    )),
    Iconss(
        icon: Icon(
      Icons.memory,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.label,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.portrait,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.pan_tool,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.power,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.list,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.category,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.access_alarms,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.access_time,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.accessibility,
      color: Colors.amber[200],
    )),
    Iconss(
        icon: Icon(
      Icons.account_balance,
      color: Colors.amber[200],
    )),
  ];
  List<Iconss> get items {
    return [..._items];
  }
}
