import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/screens/teammateprofile.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/sliderightroute.dart';

class SearchChateMember extends StatefulWidget {
  @override
  _SearchChateMemberState createState() => _SearchChateMemberState();
}

class _SearchChateMemberState extends State<SearchChateMember> {
  var diviceSize = 470;
  double divSize = 550;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  InputDecoration _textDecoration(String lable, double fontSize, Icon icon) {
    return InputDecoration(
      hintText: lable,
      hintStyle:
          TextStyle(color: Colors.amber[300], height: 1, fontSize: fontSize),
      prefixIcon: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 10,
          child: Image.asset("assets/icons/profileIcon.png"),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.amber[300]),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          PageBackground(
              size: size, imagePath: 'assets/images/profilebackground.png'),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ShaderMask(
                        shaderCallback: (bounds) => RadialGradient(
                          colors: [
                            Colors.white,
                            Colors.yellow[400],
                            Colors.white
                          ],
                        ).createShader(bounds),
                        child: GestureDetector(
                          onTap: () {
                            print("hello");
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: CircleAvatar(
                            radius: size.height > divSize ? 20 : 10,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              'assets/icons/Sidebar.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          SlideRightRoute(
                            page: TeamMateProfile(),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: size.height > divSize ? 20 : 10,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/icons/home.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // onChanged: (value) {
                    //   setState(() {
                    //     _usages = value;
                    //   });
                    // },
                    // controller: _usagesController,
                    style: TextStyle(
                        color: Colors.yellow[300],
                        fontSize: size.height > diviceSize ? 30 : 18),
                    decoration: _textDecoration(
                      'Search Member',
                      size.height > diviceSize ? 30 : 18,
                      Icon(
                        Icons.search,
                        color: Colors.black87,
                        size: size.height > diviceSize ? 40 : 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height > diviceSize ? 40 : 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.amber[300],
                        ),
                      ),
                    ),
                    child: Text(
                      "Members",
                      style: TextStyle(
                          fontSize: size.height > divSize ? 22 : 15,
                          color: Colors.white54,
                          // decoration: TextDecoration.underline,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: size.height > diviceSize ? 40 : 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    width: size.width,
                    height: 220,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      // key: ValueKey(new Random().nextInt(100)),
                                      radius:
                                          size.height > diviceSize ? 70 : 30,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: AssetImage(
                                          'assets/images/profileimage.png')),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "AKASH GAJERA",
                                          style: TextStyle(
                                              color: Colors.amber[300]),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Lorem Inpsim hdiss jjdfojnf ",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                DateFormat("hh-mm").format(DateTime.now()),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo(
      {Key key,
      @required this.size,
      @required this.diviceSize,
      @required this.icon})
      : super(key: key);

  final Size size;
  final int diviceSize;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.amber,
              ]),
          borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
        ),
        child: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: size.height > diviceSize ? 60 : 30,
            height: size.height > diviceSize ? 60 : 30,
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
