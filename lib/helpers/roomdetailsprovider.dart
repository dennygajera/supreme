import 'package:flutter/foundation.dart';

class RoomDetailss {
  final String title;
  final String organisationDetails;
  final String discountDetails;

  RoomDetailss({
    @required this.title,
    @required this.organisationDetails,
    @required this.discountDetails,
  });
}

class RoomDetailsProvider with ChangeNotifier {
  List<RoomDetailss> _items = [
    RoomDetailss(
        title: 'OYO ROOMS',
        organisationDetails:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful conten used to demonstrate the visual.',
        discountDetails:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful conten used to demonstrate the visual.')
  ];

  List<RoomDetailss> get items {
    return [..._items];
  }
}
