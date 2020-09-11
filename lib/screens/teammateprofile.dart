import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:login/screens/editprofile.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';

class TeamMateProfile extends StatefulWidget {
  @override
  _TeamMateProfileState createState() => _TeamMateProfileState();
}

class _TeamMateProfileState extends State<TeamMateProfile> {
  var diviceSize = 470;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _qrData = "Amit Butani";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfile()));
              // Navigator.of(context).pushNamed('/project-details');
            },
            child: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height > diviceSize ? 40 : 25,
                  child: Image.asset('assets/icons/contractDetail.png')),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height > diviceSize ? 40 : 25,
                  child: Image.asset('assets/icons/message.png')),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageBackground(
              size: size, imagePath: 'assets/images/profilebackground.png'),
          Padding(
            padding: size.height > diviceSize
                ? const EdgeInsets.all(28.0)
                : const EdgeInsets.only(top: 18, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle(
                    size: size,
                    diviceSize: diviceSize,
                    title: "Team Mate Profile"),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: size.height > diviceSize
                      ? const EdgeInsets.symmetric(horizontal: 28.0)
                      : const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: size.height > diviceSize
                            ? size.width / 2
                            : size.width / 2 - 50,
                        height: size.height > diviceSize
                            ? size.height - 150
                            : size.height - 86,
                        // color: Colors.white,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                  key: ValueKey(new Random().nextInt(100)),
                                  radius: size.height > diviceSize ? 70 : 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                      'assets/images/profileimage.png')),
                              SizedBox(
                                height: size.height > diviceSize ? 20 : 10,
                              ),
                              Text(
                                "Profile Name",
                                style: TextStyle(
                                  color: Colors.amber[200],
                                  fontSize: size.height > diviceSize ? 35 : 20,
                                ),
                              ),
                              SizedBox(
                                height: size.height > diviceSize ? 30 : 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Link',
                                  style: TextStyle(
                                    color: Colors.amber[200],
                                    fontSize:
                                        size.height > diviceSize ? 25 : 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              YouLink(
                                size: size,
                                diviceSize: diviceSize,
                                heading: 'Youtube',
                                link: "WWW.YOUTUBE.COM",
                                scaffoldKey: _scaffoldKey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              YouLink(
                                size: size,
                                diviceSize: diviceSize,
                                heading: 'Linkedin',
                                link: "WWW.LINKEDIN.COM",
                                scaffoldKey: _scaffoldKey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'About Us',
                                  style: TextStyle(
                                    color: Colors.amber[200],
                                    fontSize:
                                        size.height > diviceSize ? 25 : 10,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: size.width,
                                height: 100,
                                // color: Colors.amber,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500sLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                          color: Colors.amber[300],
                                          fontSize: size.height > diviceSize
                                              ? 25
                                              : size.width < 600 ? 10 : 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      RatingBar(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 0.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Total Earned Amount",
                                        style: TextStyle(
                                          color: Colors.amber[300],
                                          fontSize: size.height > diviceSize
                                              ? 25
                                              : size.width < 600 ? 10 : 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "\$ 1000.00",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: size.height > diviceSize
                                              ? 25
                                              : size.width < 600 ? 10 : 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: size.height > diviceSize
                              ? const EdgeInsets.symmetric(horizontal: 150)
                              : const EdgeInsets.symmetric(horizontal: 90),
                          width:
                              size.height > diviceSize ? size.width / 2 : 200,
                          height: size.height > diviceSize
                              ? size.height - 150
                              : size.height - 100,
                          // color: Colors.pink,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        color: Colors.amber[300],
                                        fontSize:
                                            size.height > diviceSize ? 25 : 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          size: size.height > diviceSize
                                              ? 20
                                              : 10,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width:
                                              size.height > diviceSize ? 20 : 5,
                                        ),
                                        Text(
                                          "London , Europ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height > diviceSize
                                                ? 25
                                                : 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height > diviceSize ? 30 : 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Occuption',
                                      style: TextStyle(
                                        color: Colors.amber[300],
                                        fontSize:
                                            size.height > diviceSize ? 25 : 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Fashion Model",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.height > diviceSize
                                                  ? 25
                                                  : 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height > diviceSize ? 50 : 10,
                                ),
                                Container(
                                  // height: size.height > diviceSize
                                  //     ? 250
                                  //     : 200,
                                  // width: size.height > diviceSize
                                  //     ? size.width
                                  //     : 200,
                                  color: Colors.amber[300],
                                  // color: Colors.amber[300],
                                  child: QrImage(
                                    size: size.width < 600 ? 100 : 200,
                                    data: _qrData,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height > diviceSize ? 30 : 10,
                                ),
                                Container(
                                  height: 3,
                                  width: size.height > diviceSize
                                      ? size.width
                                      : 200,
                                  color: Colors.amber[300],
                                ),
                                SizedBox(
                                  height: size.height > diviceSize ? 30 : 10,
                                ),
                                Container(
                                  height: size.height > diviceSize ? 100 : 50,
                                  width: size.height > diviceSize
                                      ? size.width
                                      : 200,
                                  // color: Colors.amber[300],
                                  child: Image.asset(
                                    'assets/images/Barcode.png',
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PointCredit extends StatelessWidget {
  const PointCredit({
    Key key,
    @required this.size,
    @required this.diviceSize,
    @required this.heading1,
    @required this.value1,
    @required this.heading2,
    @required this.value2,
  }) : super(key: key);

  final Size size;
  final int diviceSize;
  final String heading1;
  final String value1;
  final String heading2;
  final String value2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading1,
              style: TextStyle(
                color: Colors.amber[300],
                fontSize:
                    size.height > diviceSize ? 25 : size.width < 600 ? 10 : 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value1,
              style: TextStyle(
                color: Colors.white,
                fontSize:
                    size.height > diviceSize ? 20 : size.width < 600 ? 10 : 15,
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.height > diviceSize ? 180 : 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading2,
              style: TextStyle(
                color: Colors.amber[300],
                fontSize:
                    size.height > diviceSize ? 25 : size.width < 600 ? 10 : 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value2,
              style: TextStyle(
                color: Colors.white,
                fontSize:
                    size.height > diviceSize ? 20 : size.width < 600 ? 10 : 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class YouLink extends StatelessWidget {
  const YouLink({
    Key key,
    @required this.size,
    @required this.diviceSize,
    @required this.heading,
    @required this.link,
    @required this.scaffoldKey,
  }) : super(key: key);

  final Size size;
  final int diviceSize;
  final String heading;
  final String link;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            heading,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.height > diviceSize ? 23 : 10,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: size.width,
          height: size.height > diviceSize ? 80 : 40,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  link,
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: size.height > diviceSize ? 23 : 10,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: link));
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  scaffoldKey.currentState.showSnackBar(new SnackBar(
                    content: new Text("Copied to Clipboard"),
                  ));
                },
                child: Text(
                  'Copy',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.amber[300],
                    fontSize: size.height > diviceSize ? 23 : 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
