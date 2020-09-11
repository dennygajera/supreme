import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:login/API/profileapi.dart';
import 'package:login/screens/ownprofile.dart';
import 'package:login/widgets/cardmonthinputformatter.dart';
import 'package:login/widgets/cardnumberinputformateer.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  ProfileModal objProfileModal;

  EditProfile({this.objProfileModal});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var diviceSize = 470;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController;
  TextEditingController _ytLinkController;
  TextEditingController _linkedinController;
  TextEditingController _locationController;
  TextEditingController _creditController;
  TextEditingController _occuptionController;
  TextEditingController _cvvController;
  TextEditingController _pinController;
  TextEditingController _dailyChargeController;
  TextEditingController _dateChangeController;

  String _name;
  String _ytLink;
  String _linkedinLink;
  String _location;
  String _initialImage;
  String _creditcard;
  String _occuption;
  String _cvv;
  String _pin;
  String _dailyCharge;
  String _date;

  File _image;
  final picker = ImagePicker();
  bool _isinit = true;
  bool _isLoad = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_isinit) {
      print("Initial Value");
      _nameController =
          TextEditingController(text: widget.objProfileModal.name);
      _ytLinkController =
          TextEditingController(text: widget.objProfileModal.youtube);
      _linkedinController =
          TextEditingController(text: widget.objProfileModal.linkdin);
      _locationController =
          TextEditingController(text: widget.objProfileModal.location);
      _creditController =
          TextEditingController(text: widget.objProfileModal.creditcard);
      _occuptionController =
          TextEditingController(text: widget.objProfileModal.occupation);
      _cvvController =
          TextEditingController(text: widget.objProfileModal.cardcvv);
      _pinController =
          TextEditingController(text: widget.objProfileModal.cardpin);
      _dailyChargeController =
          TextEditingController(text: widget.objProfileModal.dailycharge);
      _dateChangeController =
          TextEditingController(text: widget.objProfileModal.cardexpirydate);
      _initialImage = widget.objProfileModal.profileimg;
    }
    _isinit = false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _submit(_name, _ytLink, _linkedinLink, _location);
              // Navigator.of(context).pushNamed('/project-details');
            },
            child: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height > diviceSize ? 40 : 30,
                  child: Image.asset('assets/icons/Acept.png')),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/own-profile'),
            child: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height > diviceSize ? 40 : 30,
                  child: Image.asset('assets/icons/Decline.png')),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Stack(
          children: <Widget>[
            PageBackground(
                size: size, imagePath: 'assets/images/profilebackground.png'),
            _isLoad
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: size.height > diviceSize
                          ? const EdgeInsets.all(28.0)
                          : const EdgeInsets.only(top: 18, right: 18, left: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              OwnProfile()));
                                  // Navigator.of(context).pushNamed('/project-details');
                                },
                                child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                        'assets/icons/backicon.png')),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                          color: Colors.amber[300],
                                          fontSize: size.height > diviceSize
                                              ? 40
                                              : 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: size.height > diviceSize
                                ? const EdgeInsets.symmetric(horizontal: 28.0)
                                : const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: _showMyDialog,
                                    child: Container(
                                        padding: EdgeInsets.only(left: 50),
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: size.height > diviceSize
                                                  ? 70
                                                  : 50,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: _image == null
                                                  ? _initialImage == ''
                                                      ? AssetImage(
                                                          'assets/images/profileimage.png')
                                                      : NetworkImage(
                                                          _initialImage)
                                                  : FileImage(_image),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 65.0, left: 72),
                                              child: CircleAvatar(
                                                radius: 15,
                                                child: Image.asset(
                                                    'assets/icons/addimgicon.png'),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      size.height > diviceSize
                                          ? _formField(
                                              'Name',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Usericon.png',
                                              _nameController,
                                            )
                                          : _formField(
                                              'Name',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Usericon.png',
                                              _nameController,
                                            ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      size.height > diviceSize
                                          ? _formField(
                                              'Youtube Link(optional)',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Lickicon.png',
                                              _ytLinkController)
                                          : _formField(
                                              'Youtube Link(optional)',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Lickicon.png',
                                              _ytLinkController),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      size.height > diviceSize
                                          ? _formField(
                                              'Linkedin(optional)',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Lickicon.png',
                                              _linkedinController)
                                          : _formField(
                                              'Linkedin(optional)',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Lickicon.png',
                                              _linkedinController),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      size.height > diviceSize
                                          ? _formField(
                                              'Location',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Locationicon.png',
                                              _locationController,
                                            )
                                          : _formField(
                                              'Location',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Locationicon.png',
                                              _locationController,
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      // size.height > diviceSize
                                      //     ? _formField(
                                      //         'Credit Card',
                                      //         size.width / 2 - 42,
                                      //         30,
                                      //         'assets/icons/Usericon.png',
                                      //         _creditcard,
                                      //         _creditController,
                                      //       )
                                      //     : _formField(
                                      //         'Credit Card',
                                      //         size.width / 2 - 42,
                                      //         15,
                                      //         'assets/icons/Usericon.png',
                                      //         _creditcard,
                                      //         _creditController,
                                      //       ),
                                      // SizedBox(
                                      //   width: 12,
                                      // ),
                                      size.height > diviceSize
                                          ? _formField(
                                              'Occuption',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Lickicon.png',
                                              _occuptionController)
                                          : _formField(
                                              'Occuption',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Lickicon.png',
                                              _occuptionController),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Credit Card Details",
                                        style: TextStyle(
                                            color: Colors.amber[300],
                                            fontSize: size.height > diviceSize
                                                ? 20
                                                : 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      size.height > diviceSize
                                          ? _formField(
                                              'Credit card number',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/Lickicon.png',
                                              _creditController)
                                          : _formField(
                                              'Credit card number',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/Lickicon.png',
                                              _creditController),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      size.height > diviceSize
                                          ? _formField(
                                              'CVV',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/password.png',
                                              _cvvController,
                                            )
                                          : _formField(
                                              'CVV',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/password.png',
                                              _cvvController,
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      size.height > diviceSize
                                          ? _formField(
                                              'Pin',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/password.png',
                                              _pinController)
                                          : _formField(
                                              'Pin',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/password.png',
                                              _pinController),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        width: size.width / 2 - 42,
                                        child: TextFormField(
                                          controller: _dateChangeController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter
                                                .digitsOnly,
                                            new LengthLimitingTextInputFormatter(
                                                4),
                                            CardMonthInputFormatter()
                                          ],
                                          onSaved: (value) {
                                            setState(() {
                                              _date = value;
                                            });
                                            print(value);
                                            print(_date);
                                          },
                                          style: TextStyle(
                                              color: Colors.yellow[300],
                                              fontSize: 15),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                              top: 15,
                                            ),
                                            hintText: "MM / YY",
                                            hintStyle: TextStyle(
                                                color: Colors.amber[300],
                                                fontSize: 15),
                                            prefixIcon: Container(
                                              padding: EdgeInsets.all(8),
                                              margin: EdgeInsets.only(right: 0),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 10,
                                                child: Image.asset(
                                                    "assets/icons/password.png"),
                                              ),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.amber),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.yellow),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Daily Charge",
                                        style: TextStyle(
                                            color: Colors.amber[300],
                                            fontSize: size.height > diviceSize
                                                ? 20
                                                : 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      size.height > diviceSize
                                          ? _formField(
                                              'Daily Charge',
                                              size.width / 2 - 42,
                                              30,
                                              'assets/icons/calender.png',
                                              _dailyChargeController,
                                            )
                                          : _formField(
                                              'Daily Charge',
                                              size.width / 2 - 42,
                                              15,
                                              'assets/icons/calender.png',
                                              _dailyChargeController,
                                            ),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                ],
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
    );
  }

  Widget _formField(
    String lable,
    double width,
    double fontSize,
    String image,
    TextEditingController controller,
  ) {
    return Container(
      width: width,
      child: TextFormField(
        inputFormatters: lable == 'Credit card number'
            ? [
                WhitelistingTextInputFormatter.digitsOnly,
                new LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter()
              ]
            : [],
        obscureText: lable == 'CVV' || lable == 'Pin' ? true : false,
        validator: lable == 'Name'
            ? (value) {
                if (value.isEmpty) {
                  return 'Please enter valid text';
                }
                return null;
              }
            : (value) {
                return null;
              },
        // : (value) {
        //     Pattern pattern =
        //         r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
        //     RegExp regex = new RegExp(pattern);
        //     if (!regex.hasMatch(value)) {
        //       return 'Please Enter Valid Link';
        //     }
        //     return null;
        //   },
        keyboardType: lable == 'Credit card number' ||
                lable == 'CVV' ||
                lable == 'Pin' ||
                lable == 'Daily Charge'
            ? TextInputType.number
            : TextInputType.text,
        controller: controller,
        onSaved: (value) {
          setState(() {
            if (lable == 'Name') {
              _name = value;
            }
            if (lable == 'Youtube Link(optional)') {
              _ytLink = value;
            }
            if (lable == 'Linkedin(optional)') {
              _linkedinLink = value;
            }
            if (lable == 'Location') {
              _location = value;
            }
            if (lable == 'Occuption') {
              _occuption = value;
            }
            if (lable == 'Credit card number') {
              _creditcard = value;
            }
            if (lable == 'CVV') {
              _cvv = value;
            }
            if (lable == 'Pin') {
              _pin = value;
            }
            if (lable == 'Daily Charge') {
              _dailyCharge = value;
            }
          });
        },
        style: TextStyle(color: Colors.yellow[300], fontSize: fontSize),
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

  Future getImageFromCam() async {
    Navigator.of(context).pop();
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 10,
        maxHeight: 200,
        maxWidth: 200);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future getImageFromGal() async {
    Navigator.of(context).pop();
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 10,
        maxHeight: 200,
        maxWidth: 200);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Pick Photo",
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          backgroundColor: Color.fromRGBO(37, 36, 41, 1),
          content: Container(
            height: 100,
            width: 200,
            child: Column(
              children: [
                GestureDetector(
                  onTap: getImageFromCam,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Text(
                      "Camera",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                GestureDetector(
                  onTap: getImageFromGal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Gallery",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submit(
      String name, String ytLink, String linkedinLink, String location) async {
    if (_formKey.currentState.validate()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      _formKey.currentState.save();
      try {
        setState(() {
          _isLoad = true;
        });
        _image == null
            ? await Provider.of<ProfileApi>(context, listen: false).updatePro(
                _name,
                _ytLink,
                _linkedinLink,
                _location,
                _creditcard,
                _occuption,
                _cvv,
                _pin,
                _date,
                _dailyCharge,
              )
            : await Provider.of<ProfileApi>(context, listen: false)
                .updateProWithimg(
                    _name,
                    _ytLink,
                    _linkedinLink,
                    _location,
                    _image,
                    _creditcard,
                    _occuption,
                    _cvv,
                    _pin,
                    _date,
                    _dailyCharge);
        setState(() {
          _isLoad = false;
        });
        Navigator.of(context).pushReplacementNamed('/own-profile');
      } catch (e) {
        print("Error" + e);
        setState(() {
          _isLoad = false;
        });
      }

      print("_name" + _name);
      print("_ytLink" + _ytLink);
      print("_linkedinLink" + _linkedinLink);
      print("_location" + _location);
      print("_creditcard" + _creditcard);
      print("_cvv" + _cvv);
      print("_pin" + _pin);
      print("_dailyCharge" + _dailyCharge);
      print(_image);
    }
  }
}
