import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key key,
    @required this.size,
    @required this.diviceSize,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final int diviceSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.of(context).pushNamed('/project-details');
          },
          child: Container(
              padding: EdgeInsets.only(top: 10),
              height: 30,
              width: 30,
              child: Image.asset('assets/icons/backicon.png')),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.amber[300],
                    fontSize: size.height > diviceSize ? 40 : 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
