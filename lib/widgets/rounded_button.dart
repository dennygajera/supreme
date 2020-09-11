import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Icon iconData;
  final double radius;

  const RoundedButton({
    Key key,
    this.text,
    this.iconData,
    @required this.onTap,
    @required this.radius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
    // return EaseInWidget(
    //   key: key,
    //   onTap: onTap,
    //   child: Material(
    //     child: CircleAvatar(
    //       backgroundColor: Colors.grey[800],
    //       radius: radius,
    //       child: iconData,
    //     ),
    //   ),
    // );
  }
}
