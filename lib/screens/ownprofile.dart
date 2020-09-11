import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/API/profileapi.dart';
import 'package:login/screens/editprofile.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnProfile extends StatefulWidget {
  @override
  _OwnProfileState createState() => _OwnProfileState();
}

class _OwnProfileState extends State<OwnProfile> {
  var diviceSize = 470;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  var _name = '';
  var _youLink = '';
  var _linkedLink = '';
  var _profileImage = '';
  var _location = '';
  var _creditcard = '';
  var _occupation = '';
  bool _load = false;
  String _qrData = "Amit Butani";
  ProfileModal objProfileModal;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    print("In Profile did");
    imageCache.clear();
    imageCache.clearLiveImages();
    if (_isInit) {
      try {
        setState(() {
          _load = true;
        });
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        final _userEmail = sharedPreferences.getString('email');
        objProfileModal =
            await Provider.of<ProfileApi>(context, listen: false).getProfile();
        print("In Profile Map" + objProfileModal.name);
        // print(map['profileimg']);
        setState(() {
          _name = objProfileModal.name;
          _location = objProfileModal.location;
          _linkedLink = objProfileModal.linkdin;
          _youLink = objProfileModal.youtube;
          _profileImage = objProfileModal.profileimg;
          _creditcard = objProfileModal.creditcard;
          _occupation = objProfileModal.occupation;
          _qrData = _userEmail;
        });
        print("_profileImage" + _profileImage);
        setState(() {
          _load = false;
        });
      } catch (error) {
        print(error);
      }
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  EditProfile(objProfileModal: objProfileModal)));
          // Navigator.of(context).pushNamed('/project-details');
        },
        child: Container(
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: size.height > diviceSize ? 40 : 20,
              child: Image.asset('assets/images/editicon.png')),
        ),
      ),
      body: Stack(
        children: <Widget>[
          PageBackground(
              size: size, imagePath: 'assets/images/profilebackground.png'),
          _load
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: size.height > diviceSize
                      ? const EdgeInsets.all(28.0)
                      : const EdgeInsets.only(top: 18, right: 18, left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PageTitle(
                          size: size,
                          diviceSize: diviceSize,
                          title: "Own Profile"),
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
                                      radius:
                                          size.height > diviceSize ? 70 : 30,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: _profileImage == ""
                                          ? AssetImage(
                                              'assets/images/profileimage.png')
                                          : NetworkImage(_profileImage),
                                    ),
                                    SizedBox(
                                      height:
                                          size.height > diviceSize ? 20 : 10,
                                    ),
                                    Text(
                                      _name,
                                      style: TextStyle(
                                        color: Colors.amber[200],
                                        fontSize:
                                            size.height > diviceSize ? 35 : 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          size.height > diviceSize ? 30 : 10,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Link',
                                        style: TextStyle(
                                          color: Colors.amber[200],
                                          fontSize: size.height > diviceSize
                                              ? 25
                                              : 15,
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
                                      link: _youLink == ""
                                          ? "WWW.YOUTUBE.COM"
                                          : _youLink,
                                      scaffoldKey: _scaffoldKey,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    YouLink(
                                      size: size,
                                      diviceSize: diviceSize,
                                      heading: 'Linkedin',
                                      link: _linkedLink == ""
                                          ? "WWW.LINKEDIN.COM"
                                          : _linkedLink,
                                      scaffoldKey: _scaffoldKey,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PointCredit(
                                      size: size,
                                      diviceSize: diviceSize,
                                      heading1: "Loyalty Point",
                                      value1: "70 Points",
                                      heading2: "Total Earned Amount",
                                      value2: "\$ 1000.00",
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PointCredit(
                                      size: size,
                                      diviceSize: diviceSize,
                                      heading1: "SUPREME Card",
                                      value1: "\$ 500.00",
                                      heading2: "Credit Card",
                                      value2: _creditcard == ''
                                          ? "**** **** **** 1234"
                                          : _creditcard,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: size.height > diviceSize
                                    ? const EdgeInsets.symmetric(
                                        horizontal: 150)
                                    : const EdgeInsets.symmetric(
                                        horizontal: 90),
                                width: size.height > diviceSize
                                    ? size.width / 2
                                    : 200,
                                height: size.height > diviceSize
                                    ? size.height - 150
                                    : size.height - 100,
                                // color: Colors.pink,
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              color: Colors.amber[300],
                                              fontSize: size.height > diviceSize
                                                  ? 25
                                                  : 15,
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
                                                width: size.height > diviceSize
                                                    ? 20
                                                    : 5,
                                              ),
                                              Text(
                                                _location,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      size.height > diviceSize
                                                          ? 25
                                                          : size.width < 600
                                                              ? 8
                                                              : 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            size.height > diviceSize ? 30 : 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Occuption',
                                            style: TextStyle(
                                              color: Colors.amber[300],
                                              fontSize: size.height > diviceSize
                                                  ? 25
                                                  : 15,
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
                                                _occupation,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        size.height > diviceSize
                                                            ? 25
                                                            : 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            size.height > diviceSize ? 50 : 10,
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
                                        height:
                                            size.height > diviceSize ? 30 : 10,
                                      ),
                                      Container(
                                        height: 3,
                                        width: size.height > diviceSize
                                            ? size.width
                                            : 200,
                                        color: Colors.amber[300],
                                      ),
                                      SizedBox(
                                        height:
                                            size.height > diviceSize ? 30 : 10,
                                      ),
                                      Container(
                                        height:
                                            size.height > diviceSize ? 100 : 50,
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
