import 'package:flutter/foundation.dart';

class Member {
  final String name;
  final String secondName;
  final double amount;
  final String location;

  Member(
      {@required this.name,
      @required this.secondName,
      @required this.amount,
      @required this.location});
}

class MembersProvider with ChangeNotifier {
  List<Member> _items = [
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
    Member(
        name: 'Akash Gajera',
        secondName: 'Akash Gajera',
        amount: 240.00,
        location: "London"),
  ];

  List<Member> get items {
    return [..._items];
  }
}
