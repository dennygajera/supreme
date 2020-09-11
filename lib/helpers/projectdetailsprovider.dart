import 'package:flutter/foundation.dart';

class ProjectDetailss {
  final String hotalName;
  final String location;
  final List<DateTime> dateTime;
  final double price;
  final String names;
  final String website;
  final String uses;
  final String notes;

  ProjectDetailss({
    @required this.hotalName,
    @required this.location,
    @required this.dateTime,
    @required this.names,
    @required this.notes,
    @required this.price,
    @required this.uses,
    @required this.website,
  });
}

class ProjectDetailsProvider with ChangeNotifier {
  List<ProjectDetailss> _items = [
    ProjectDetailss(
        hotalName: 'Hotel',
        location: 'Mumbai',
        dateTime: [DateTime.now(), DateTime.now().add(Duration(days: 7))],
        names: 'Smit S. William , Akash Gajera , Kapil Maheshvari',
        website: 'WWW.SUPREMECARD.COM',
        price: 250.00,
        uses:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful conten used to demonstrate the visual.',
        notes:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful conten used to demonstrate the visual.')
  ];

  List<ProjectDetailss> get items {
    return [..._items];
  }
}
