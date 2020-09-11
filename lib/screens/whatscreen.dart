import 'package:flutter/material.dart';
import 'package:login/helpers/iconprovider.dart';
import 'package:login/helpers/tabiconprovider.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class WhatScreen extends StatefulWidget {
  @override
  _WhatScreenState createState() => _WhatScreenState();
}

class _WhatScreenState extends State<WhatScreen> {
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();

  double divSize = 470;

  int speedFactor = 20;
  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;
    print(maxExtent);
    _scrollController
        .animateTo(maxExtent,
            duration: Duration(seconds: durationDouble.toInt()),
            curve: Curves.linear)
        .then((value) {});
    double maxExtent2 = _scrollController.position.maxScrollExtent;
    double distanceDifference2 = maxExtent - _scrollController.offset;
    double durationDouble2 = distanceDifference2 / speedFactor;
    print(maxExtent2);
    _scrollController2.animateTo(maxExtent2,
        duration: Duration(seconds: durationDouble2.toInt()),
        curve: Curves.linear);
  }

  Widget _formField(String lable, double width, double fontSize) {
    // FocusNode myFocusNode = new FocusNode();
    return Container(
      width: width,
      child: TextFormField(
        // focusNode: myFocusNode,
        style: TextStyle(color: Colors.yellow[300]),

        decoration: InputDecoration(
          hintText: lable,
          hintStyle:
              TextStyle(color: Colors.grey, height: 1.5, fontSize: fontSize),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          icon: ClipOval(
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
                    width: fontSize == 30 ? 50 : 30,
                    height: fontSize == 30 ? 50 : 30,
                    child: Center(
                        child: Icon(
                      Icons.help_outline,
                      color: Colors.black87,
                      size: fontSize == 30 ? 30 : 20,
                    ))),
              ),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<IconProvider>(context);
    final icon = productData.items;
    final tabIconData = Provider.of<TabIconProvider>(context);
    final tabIcon = tabIconData.items;
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageBackground(size: size, imagePath: 'assets/background.png'),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                    child: Row(
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
                          child: IconButton(
                            iconSize: size.height > divSize ? 50 : 30,
                            icon: Icon(Icons.menu),
                            color: Colors.amber[200],
                            onPressed: () {},
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => RadialGradient(
                            colors: [
                              Colors.white,
                              Colors.yellow[400],
                              Colors.white
                            ],
                          ).createShader(bounds),
                          child: IconButton(
                            iconSize: size.height > divSize ? 50 : 30,
                            icon: Icon(Icons.home),
                            color: Colors.amber[200],
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: size.height > divSize ? 80 : 60,
                          width: size.height > divSize ? 550 : 300,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, i) => Padding(
                              padding: size.height > divSize
                                  ? const EdgeInsets.symmetric(horizontal: 15)
                                  : const EdgeInsets.symmetric(horizontal: 0),
                              child: RoundedButton(
                                onTap: () {
                                  print(icon[i].icon.icon);
                                },
                                iconData: size.height > divSize
                                    ? tabIcon[i].icon
                                    : icon[i].icon,
                                radius: size.height > divSize ? 40 : 30,
                              ),
                            ),
                            itemCount: icon.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height > divSize ? 0 : 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: size.height > divSize ? 450 : 200,
                            width: size.height > divSize ? 80 : 60,
                            child: ListView.builder(
                              itemBuilder: (_, i) => Padding(
                                padding: size.height > divSize
                                    ? const EdgeInsets.symmetric(vertical: 15)
                                    : const EdgeInsets.symmetric(vertical: 0),
                                child: RoundedButton(
                                  onTap: () {
                                    print(icon[i].icon.icon);
                                  },
                                  iconData: size.height > divSize
                                      ? tabIcon[i].icon
                                      : icon[i].icon,
                                  radius: size.height > divSize ? 40 : 30,
                                ),
                              ),
                              itemCount: icon.length,
                            ),
                          ),
                          Padding(
                            padding: size.height > divSize
                                ? const EdgeInsets.only(top: 58.0)
                                : const EdgeInsets.only(top: 8.0),
                            child: size.height > divSize
                                ? _formField('What', 650, 30)
                                : _formField('What', 450, 20),
                          ),
                          Container(
                            height: size.height > divSize ? 450 : 200,
                            width: size.height > divSize ? 80 : 60,
                            child: ListView.builder(
                              itemBuilder: (_, i) => Padding(
                                padding: size.height > divSize
                                    ? const EdgeInsets.symmetric(vertical: 15)
                                    : const EdgeInsets.symmetric(vertical: 0),
                                child: RoundedButton(
                                  onTap: () {
                                    print(icon[i].icon.icon);
                                  },
                                  iconData: size.height > divSize
                                      ? tabIcon[i].icon
                                      : icon[i].icon,
                                  radius: size.height > divSize ? 40 : 30,
                                ),
                              ),
                              itemCount: icon.length,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: size.height > divSize
                            ? const EdgeInsets.only(top: 500.0)
                            : const EdgeInsets.only(top: 120.0),
                        child: Center(
                          child: Container(
                            height: size.height > divSize ? 90 : 60,
                            width: size.height > divSize ? 670 : 400,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, i) => Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: size.height > divSize
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 15)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 0),
                                    child: RoundedButton(
                                      onTap: () {
                                        print(icon[i].icon.icon);
                                      },
                                      iconData: size.height > divSize
                                          ? tabIcon[i].icon
                                          : icon[i].icon,
                                      radius: size.height > divSize ? 50 : 40,
                                    ),
                                  ),
                                  Padding(
                                    padding: size.height > divSize
                                        ? const EdgeInsets.only(
                                            top: 50.0, left: 75)
                                        : const EdgeInsets.only(
                                            top: 35.0, left: 50),
                                    child: ClipOval(
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          color: Colors.grey[900],
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(50.0)),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                              width: size.height > divSize
                                                  ? 30
                                                  : 20,
                                              height: size.height > divSize
                                                  ? 30
                                                  : 20,
                                              child: Center(
                                                child: Text(
                                                  '20%',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height > divSize
                                                              ? 15
                                                              : 10,
                                                      color:
                                                          Colors.yellowAccent),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: icon.length,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: size.height > divSize
                            ? const EdgeInsets.only(top: 590.0)
                            : const EdgeInsets.only(top: 180.0),
                        child: Center(
                          child: Container(
                            height: size.height > divSize ? 90 : 60,
                            width: size.height > divSize ? 670 : 400,
                            child: ListView.builder(
                              controller: _scrollController2,
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (_, i) => Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: size.height > divSize
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 15)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 0),
                                    child: RoundedButton(
                                      onTap: () {
                                        print(icon[i].icon.icon);
                                      },
                                      iconData: size.height > divSize
                                          ? tabIcon[i].icon
                                          : icon[i].icon,
                                      radius: size.height > divSize ? 50 : 40,
                                    ),
                                  ),
                                  Padding(
                                    padding: size.height > divSize
                                        ? const EdgeInsets.only(
                                            top: 50.0, left: 75)
                                        : const EdgeInsets.only(
                                            top: 35.0, left: 50),
                                    child: ClipOval(
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          color: Colors.grey[900],
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(50.0)),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                              width: size.height > divSize
                                                  ? 30
                                                  : 20,
                                              height: size.height > divSize
                                                  ? 30
                                                  : 20,
                                              child: Center(
                                                child: Text(
                                                  '20%',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height > divSize
                                                              ? 15
                                                              : 10,
                                                      color:
                                                          Colors.yellowAccent),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: icon.length,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
