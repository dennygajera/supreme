import 'package:flutter/material.dart';

class ProjectProvider with ChangeNotifier {
  List<Project> _items = [];
  List<Project> get items {
    return [..._items];
  }

  void addProject(
    String what,
    String where,
    DateTime dateTime,
    double rate,
    String who,
    String link,
    String usages,
    String notes,
  ) {
    _items.add(Project(
        what: what,
        where: where,
        dateTime: dateTime,
        rate: rate,
        who: who,
        link: link,
        usages: usages,
        notes: notes));
  }
}

class Project {
  final String what;
  final String where;
  final DateTime dateTime;
  final double rate;
  final String who;
  final String link;
  final String usages;
  final String notes;

  Project({
    @required this.what,
    @required this.where,
    @required this.dateTime,
    @required this.rate,
    @required this.who,
    @required this.link,
    @required this.usages,
    @required this.notes,
  });
}
