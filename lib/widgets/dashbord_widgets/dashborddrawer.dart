import 'package:flutter/material.dart';
import 'package:login/API/logout.dart';
import 'package:provider/provider.dart';

class DashbordDrawer extends StatelessWidget {
  const DashbordDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/own-profile');
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: Image.asset('assets/icons/profileIcon.png'),
            ),
          ),
        ),
        IconButton(
          color: Colors.amber,
          icon: Icon(Icons.settings),
          onPressed: () async {
            Navigator.of(context).pushNamed('/settings');
          },
        ),
        GestureDetector(
          onTap: () {
            _showMyDialog(context);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: Image.asset('assets/icons/logout.png'),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Color.fromRGBO(37, 36, 41, 1),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Are you sure want to logout?",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async {
                await Provider.of<LogOut>(context, listen: false).logOut();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Image.asset('assets/icons/Acept.png')),
              ),
            ),
            SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    child: Image.asset('assets/icons/Decline.png')),
              ),
            ),
          ],
        );
      },
    );
  }
}
