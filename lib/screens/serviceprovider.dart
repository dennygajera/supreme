import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:login/helpers/roomimageprovider.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ServiceProvider extends StatefulWidget {
  @override
  _ServiceProviderState createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  var diviceSize = 470;

  TextEditingController _selfController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _whoController = TextEditingController();
  TextEditingController _whereController = TextEditingController();
  TextEditingController _affiliatedController = TextEditingController();
  TextEditingController _aboutUsController = TextEditingController();
  TextEditingController _discountController = TextEditingController();
  TextEditingController _coupenController = TextEditingController();

  var _self = '';
  var _website = '';
  var _who = '';
  var _where = '';
  var _affiliated = '';
  var _about = '';
  var _discount = '';
  var _coupen = '';
  bool _checked = false;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  InputDecoration _textDecoration(String lable, double fontSize, Icon icon) {
    return InputDecoration(
      hintText: lable,
      hintStyle: TextStyle(color: Colors.grey, height: 1, fontSize: fontSize),
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
                child: Center(child: icon)),
          ),
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RoomImageProvider>(context).items;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: size.height > diviceSize ? 40 : 30,
                child: Image.asset('assets/icons/loginbubble.png')),
          ),
          SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () {
              _selfController.clear();
              _whereController.clear();
              _whoController.clear();
              _aboutUsController.clear();
              _affiliatedController.clear();
              _discountController.clear();
              _websiteController.clear();
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              print(_self);
              print(_where);
              print(_about);
              print(_who);
              print(_affiliated);
              print(_website);
              print(_discount);
              print(_coupen);

              Navigator.of(context).pushNamed('/project-details');
            },
            child: Container(
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size.height > diviceSize ? 40 : 30,
                  child: Image.asset('assets/icons/loginbubble.png')),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PageBackground(size: size, imagePath: 'assets/background.png'),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageTitle(
                      size: size,
                      diviceSize: diviceSize,
                      title: "Service Provider"),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: size.width / 2 - 55,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _self = value;
                                });
                              },
                              controller: _selfController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'Self',
                                  size.height > diviceSize ? 30 : 18,
                                  Icon(
                                    Icons.help,
                                    color: Colors.black87,
                                    size: size.height > diviceSize ? 30 : 18,
                                  ))),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: size.width / 2 - 50,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _website = value;
                                });
                              },
                              controller: _websiteController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'Website',
                                  size.height > diviceSize ? 30 : 18,
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black87,
                                    size: size.height > diviceSize ? 30 : 18,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: size.width / 2 - 50,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _who = value;
                                });
                              },
                              controller: _whoController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'Who',
                                  size.height > diviceSize ? 30 : 18,
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black87,
                                    size: size.height > diviceSize ? 30 : 18,
                                  ))),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: size.width / 2 - 50,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _where = value;
                                });
                              },
                              controller: _whereController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'Where',
                                  size.height > diviceSize ? 30 : 18,
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black87,
                                    size: size.height > diviceSize ? 30 : 18,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Container(
                      width: size.width - 50,
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _affiliated = value;
                            });
                          },
                          controller: _affiliatedController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'Affiliated Program',
                              size.height > diviceSize ? 30 : 18,
                              Icon(
                                Icons.portrait,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Container(
                      width: size.width - 50,
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _about = value;
                            });
                          },
                          controller: _aboutUsController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'About Us',
                              size.height > diviceSize ? 30 : 18,
                              Icon(
                                Icons.link,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Container(
                      width: size.width - 50,
                      child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _discount = value;
                            });
                          },
                          controller: _discountController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'Discount Details',
                              size.height > diviceSize ? 30 : 18,
                              Icon(
                                Icons.map,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ))),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: size.height > diviceSize ? 300 : 170,
                        width: size.height > diviceSize ? 800 : 500,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, i) => Padding(
                            padding: size.height > diviceSize
                                ? const EdgeInsets.all(28.0)
                                : const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: getImage,
                              child: DottedBorder(
                                color: Colors.amber,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(12),
                                padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                    height: 200,
                                    width: 120,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: _image == null
                                          ? Text(
                                              "Upload Image",
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            )
                                          : Image.file(
                                              _image,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _coupen = value;
                              });
                            },
                            controller: _coupenController,
                            style: TextStyle(
                                color: Colors.yellow[300],
                                fontSize: size.height > diviceSize ? 30 : 18),
                            decoration: _textDecoration(
                                'Coupon Code',
                                size.height > diviceSize ? 30 : 18,
                                Icon(
                                  Icons.help,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ))),
                      ),
                    ],
                  ),
                  Container(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: Colors.amber,
                      ),
                      child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.black,
                          activeColor: Colors.amber,
                          title: Text("Agree To SUPREME Card Policy",
                              style: TextStyle(color: Colors.amber)),
                          value: _checked,
                          onChanged: (bool value) {
                            setState(() {
                              _checked = value;
                            });
                          }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
