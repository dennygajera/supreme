import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({
    Key key,
    @required this.size,
    @required this.diviceSize,
    @required this.task1,
  }) : super(key: key);

  final Size size;
  final int diviceSize;
  final String task1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.adjust,
          size: size.height > diviceSize ? 25 : 15,
          color: Colors.white54,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          task1,
          style: TextStyle(
            color: Colors.white54,
            fontSize: size.height > diviceSize ? 25 : 15,
          ),
        ),
      ],
    );
  }
}
