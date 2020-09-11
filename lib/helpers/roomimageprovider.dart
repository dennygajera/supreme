import 'package:flutter/cupertino.dart';
import 'package:login/helpers/imageprovider.dart';

class RoomImageProvider with ChangeNotifier {
  List<Images> _items = [
    Images(
        imageUrl:
            'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        offer: '20%'),
    Images(
        imageUrl:
            'https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
        offer: '20%'),
    Images(
        imageUrl:
            'https://images.oyoroomscdn.com/uploads/hotel_image/81612/f0af88ee7aca453a.jpg',
        offer: '20%'),
  ];
  List<Images> get items {
    return [..._items];
  }
}
