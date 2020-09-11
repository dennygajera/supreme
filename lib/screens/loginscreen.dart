import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login/API/loginapi.dart';
import 'package:login/helpers/slider/bottomdownsliderprovider.dart';
import 'package:login/helpers/slider/bottomupsliderprovider.dart';
import 'package:login/helpers/slider/leftsideslidericonprovider.dart';
import 'package:login/helpers/slider/rightsidesliderprovider.dart';
import 'package:login/screens/registration.dart';
import 'package:login/screens/forgotpasswod.dart';
import 'package:login/screens/pickroom.dart';
import 'package:login/screens/setpin.dart';
import 'package:login/screens/verifypin.dart';
import 'package:login/widgets/ease_in_widget.dart';
import 'package:login/widgets/sliderightroute.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final int selectIndex = 0;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController = ScrollController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  double maxExtent;

  var _isInit = true;

  AnimationController _controller;
  // Animation<double> _easeInAnimation;

  bool clearData = false;
  var currentOffset;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 100,
        ),
        value: 0.1);
    // _easeInAnimation = Tween(begin: 0.8, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.fastOutSlowIn,
    //   ),
    // );
    _controller.reverse();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        await Provider.of<BottomUpSliderProvider>(context, listen: false)
            .setIcon();
        await Provider.of<BottomDownSliderProvider>(context, listen: false)
            .setIcon();
      } catch (error) {
        print(error);
      }

      setState(() {
        _isLoading = false;
      });
      // print('hello');
    }
    _isInit = false;

    double screenWidth = MediaQuery.of(context).size.width;
    int select = widget.selectIndex > 0 ? widget.selectIndex : 0;
    _scrollController = ScrollController(
      initialScrollOffset: (3000 + select) * (screenWidth - 40) / 7,
    );
    _scrollController2 = ScrollController(
        initialScrollOffset: (3000 + select) * (screenWidth - 40) / 7);
  }

  String _email = '';
  String _password = '';

  int speedFactor = 20;

  double diviceSize = 470;

  var end = false;

  bool _checked = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _scrollController.dispose();
    _scrollController2.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());

    final bottomUpIconData = Provider.of<BottomUpSliderProvider>(context);
    final bottomUpSlider = bottomUpIconData.items;
    final bottomDownIconData = Provider.of<BottomDownSliderProvider>(context);
    final bottomDownSlider = bottomDownIconData.items;

    Size size = MediaQuery.of(context).size;
    double boxSize = size.height > 470 ? 70 : 50;

    if (clearData) {
      _scrollController.jumpTo(3000 * (size.width - 40) / 7);
      _scrollController2.jumpTo(3000 * (size.width - 40) / 7);

      clearData = false;
    }

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/loginbackground.png'),
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
              // PageBackground(size: size, imagePath: 'assets/icons/loginbackground.png'),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: size.height > diviceSize
                            ? EdgeInsets.only(
                                top: 108, left: 55, right: 55, bottom: 55)
                            : EdgeInsets.all(21),
                        child: Column(
                          children: <Widget>[
                            SingleChildScrollView(
                              child: Container(
                                width: size.height > diviceSize ? 650 : 400,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        size.height > diviceSize
                                            ? _formField('Email', 650, 30,
                                                'assets/icons/user.png')
                                            : _formField('Email', 450, 15,
                                                'assets/icons/user.png'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        size.height > diviceSize
                                            ? _formField('Password', 650, 30,
                                                'assets/icons/password.png')
                                            : _formField('Password', 450, 15,
                                                'assets/icons/password.png'),
                                        SizedBox(
                                          height:
                                              size.height > diviceSize ? 20 : 5,
                                        ),
                                        Container(
                                          width: size.width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _checked
                                                        ? _checked = false
                                                        : _checked = true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration:
                                                          const BoxDecoration(
                                                        border: Border(
                                                          top: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.amber),
                                                          left: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.amber),
                                                          right: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.amber),
                                                          bottom: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.amber),
                                                        ),
                                                      ),
                                                      child: Checkbox(
                                                          activeColor: Colors
                                                              .transparent,
                                                          checkColor:
                                                              Colors.amber,
                                                          value: _checked,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _checked = value;
                                                            });
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Remember Me",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .amber[300]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    size.height > diviceSize
                                                        ? const EdgeInsets.only(
                                                            top: 18.0)
                                                        : const EdgeInsets.only(
                                                            top: 8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _controller
                                                        .forward()
                                                        .then((value) {
                                                      _controller
                                                          .reverse()
                                                          .then((value) {
                                                        _submit();
                                                      });
                                                    });
                                                  },
                                                  // child: ScaleTransition(
                                                  //   scale: _easeInAnimation,
                                                  child: Container(
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        radius: size.height >
                                                                diviceSize
                                                            ? 40
                                                            : 30,
                                                        child: Image.asset(
                                                            'assets/icons/loginbubble.png')),
                                                  ),
                                                  // ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height > diviceSize
                                              ? 20
                                              : 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                _scaffoldKey.currentState
                                                    .hideCurrentSnackBar();
                                                Navigator.of(context).push(
                                                  SlideRightRoute(
                                                    page: ForgotPassword(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.amber[300],
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Amnesia?",
                                                  style: TextStyle(
                                                      color: Colors.amber[300],
                                                      fontSize: size.height >
                                                              diviceSize
                                                          ? 25
                                                          : 15),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                _scaffoldKey.currentState
                                                    .hideCurrentSnackBar();

                                                Navigator.push(
                                                  context,
                                                  SlideRightRoute(
                                                    page: RegistrationScreen(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.amber[300],
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Join?",
                                                  style: TextStyle(
                                                      color: Colors.amber[300],
                                                      fontSize: size.height >
                                                              diviceSize
                                                          ? 25
                                                          : 15),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: size.height > diviceSize
                                  ? const EdgeInsets.only(top: 88.0)
                                  : const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTapCancel: () {
                                  _scroll();
                                },
                                onTapDown: (d) {
                                  _controller.forward();
                                },
                                onTapUp: (d) {
                                  _scroll();
                                },
                                child: Container(
                                  height:
                                      size.height > diviceSize ? 100 : boxSize,
                                  width: size.height > diviceSize
                                      ? size.width
                                      : size.width,
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemExtent: size.width / 9,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (_, i) => Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: size.height > diviceSize
                                              ? EdgeInsets.symmetric(
                                                  horizontal: 25)
                                              : const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          // child: ScaleTransition(
                                          //   scale: _easeInAnimation,
                                          child: EaseInWidget(
                                              radius: 30,
                                              image: bottomUpSlider[
                                                      i % bottomUpSlider.length]
                                                  .image,
                                              secondImage: bottomUpSlider[
                                                      i % bottomUpSlider.length]
                                                  .image,
                                              onTap: () {
                                                print(bottomUpSlider[i %
                                                        bottomUpSlider.length]
                                                    .image);
                                                _scroll();
                                              }),
                                          // ),
                                        ),
                                      ],
                                    ),
                                    itemCount: bottomUpSlider.length * 10000,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: size.height > diviceSize
                                  ? const EdgeInsets.only(top: 0.0)
                                  : const EdgeInsets.only(top: 0.0),
                              child: Center(
                                child: Container(
                                  height:
                                      size.height > diviceSize ? 100 : boxSize,
                                  width: size.height > diviceSize
                                      ? size.width
                                      : size.width,
                                  child: ListView.builder(
                                    itemExtent: size.width / 9,
                                    controller: _scrollController2,
                                    scrollDirection: Axis.horizontal,
                                    reverse: true,
                                    shrinkWrap: true,
                                    itemBuilder: (_, i) => Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: size.height > diviceSize
                                                ? EdgeInsets.symmetric(
                                                    horizontal: 25)
                                                : const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            child: EaseInWidget(
                                                radius: 30,
                                                image: bottomDownSlider[i %
                                                        bottomDownSlider.length]
                                                    .image,
                                                secondImage: bottomDownSlider[
                                                        i %
                                                            bottomDownSlider
                                                                .length]
                                                    .image,
                                                onTap: () {
                                                  print(bottomDownSlider[i %
                                                          bottomDownSlider
                                                              .length]
                                                      .image);
                                                  _scroll();
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                    itemCount: bottomDownSlider.length * 10000,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formField(
    String lable,
    double width,
    double fontSize,
    String image,
  ) {
    return Container(
      width: width,
      child: TextFormField(
        validator: lable == 'Email'
            ? (value) {
                if (!EmailValidator.validate(value.trim()) || value.isEmpty) {
                  return 'Please enter valid email';
                }
                return null;
              }
            : (value) {
                if (value.isEmpty) {
                  return 'Please enter valid password';
                }
                return null;
              },
        cursorColor: Colors.white,
        controller: lable == 'Email' ? _emailController : _passwordController,
        onSaved: (value) {
          setState(() {
            lable == 'Email' ? _email = value.trim() : _password = value.trim();
          });
        },
        style: TextStyle(color: Colors.yellow[300], fontSize: fontSize),
        obscureText: lable == 'Email' ? false : true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 15,
          ),
          hintText: lable,
          hintStyle: TextStyle(color: Colors.amber[300], fontSize: fontSize),
          prefixIcon: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 10,
              child: Image.asset(image),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
        ),
      ),
    );
  }

  _scroll() {
    maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(maxExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.linear);

    double maxExtent2 = _scrollController2.position.maxScrollExtent;
    double distanceDifference2 = maxExtent2 - _scrollController2.offset;
    double durationDouble2 = distanceDifference2 / speedFactor;
    _scrollController2.animateTo(maxExtent2,
        duration: Duration(seconds: durationDouble2.toInt()),
        curve: Curves.linear);
  }

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      // print(_email);
      // print(_password);
      try {
        setState(() {
          _isLoading = true;
        });
        final response = await Provider.of<LoginApi>(context, listen: false)
            .signIn(_email.trim(), _password.trim());
        print(response[1]);
        final statusCode = response[0];
        int setPinScreen = response[1];
        final pinStatus = response[2];

        if (statusCode == 200) {
          _scaffoldKey.currentState.hideCurrentSnackBar();
          print("setpin screen  " + setPinScreen.toString());
          if (setPinScreen == 0) {
            if (pinStatus == 0) {
              Navigator.pushReplacement(
                context,
                SlideRightRoute(
                  page: PickRoom(),
                ),
              );
              _emailController.clear();
              _passwordController.clear();
            } else {
              Navigator.pushReplacement(
                context,
                SlideRightRoute(
                  page: VerifyPin(),
                ),
              );
              _emailController.clear();
              _passwordController.clear();
            }
          } else {
            Navigator.pushReplacement(
              context,
              SlideRightRoute(
                page: SetPin(),
              ),
            );
          }
        }
        setState(() {
          _isLoading = false;
        });
        await Provider.of<RightSideSliderIconProvider>(context, listen: false)
            .setIcon();
        await Provider.of<LeftSideSliderIconProvider>(context, listen: false)
            .setIcon();
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        print("eerrrsdfvsdgf");
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(error.toString())));
        // _scaffoldKey.currentState.hideCurrentSnackBar();
      }
    }
  }
}
