import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImagesProvider with ChangeNotifier {
  List<Images> _items = [
    Images(imageUrl: 'assets/images/Makemytripimg.png', offer: '20% OFF'),
    Images(imageUrl: 'assets/images/bookingimg.png', offer: '50% OFF'),
    Images(imageUrl: 'assets/images/oyoimg.png', offer: '10% OFF'),
    Images(imageUrl: 'assets/images/expediaimg.png', offer: '10% OFF'),
  ];
  List<Images> get items {
    return [..._items];
  }
}

class Images {
  String imageUrl;
  String offer;
  Images({@required this.imageUrl, @required this.offer});
}
