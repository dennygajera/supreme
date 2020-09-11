import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({
    Key key,
    @required this.size,
    @required this.imagePath,
  }) : super(key: key);

  final Size size;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: Image.asset(imagePath, fit: BoxFit.fill),
    );
  }
}
