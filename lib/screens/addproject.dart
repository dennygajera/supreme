import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  var diviceSize = 470;

  TextEditingController _whatController = TextEditingController();
  TextEditingController _whereController = TextEditingController();
  TextEditingController _rateController = TextEditingController();
  TextEditingController _whoController = TextEditingController();
  TextEditingController _linkController = TextEditingController();
  TextEditingController _usagesController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  var _what = '';
  var _where = '';
  var _rate = '';
  var _who = '';
  var _link = '';
  var _usages = '';
  var _notes = '';

  DateTime _dateTime;

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                      size: size, diviceSize: diviceSize, title: "Add Project"),
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
                                  _what = value;
                                });
                              },
                              controller: _whatController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'What',
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
                        Row(
                          children: <Widget>[
                            ClipOval(
                              child: Container(
                                decoration: new BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.white,
                                        Colors.amber,
                                      ]),
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: SizedBox(
                                    width: size.height > diviceSize ? 50 : 30,
                                    height: size.height > diviceSize ? 50 : 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.calendar_today,
                                        size:
                                            size.height > diviceSize ? 30 : 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: size.height > diviceSize
                                  ? size.width / 2 - 108
                                  : size.width / 2 - 88,
                              height: size.height > diviceSize ? 80 : 60,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.white,
                                child: ListTile(
                                  title: Text(
                                    _dateTime == null
                                        ? 'When! '
                                        : ' Picked Date : ${DateFormat().add_yMd().format(_dateTime)}',
                                    style: TextStyle(
                                        fontSize:
                                            size.height > diviceSize ? 25 : 10),
                                  ),
                                  trailing: RaisedButton(
                                    splashColor: Colors.pink[300],
                                    animationDuration: Duration(seconds: 1),
                                    color: Colors.greenAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      _dateTime == null ? 'Choose ' : "Change",
                                      style: TextStyle(
                                          fontSize: size.height > diviceSize
                                              ? 25
                                              : 10),
                                    ),
                                    onPressed: () async {
                                      await showRoundedDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now()
                                                  .subtract(Duration(days: 1)),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 1),
                                              borderRadius: 16,
                                              theme: ThemeData.dark())
                                          .then((pickdate) {
                                        if (pickdate == null) {
                                          return;
                                        }
                                        setState(() {
                                          _dateTime = pickdate;
                                        });
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: size.width / 2 - 50,
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _rate = value;
                                });
                              },
                              controller: _rateController,
                              style: TextStyle(
                                  color: Colors.yellow[300],
                                  fontSize: size.height > diviceSize ? 30 : 18),
                              decoration: _textDecoration(
                                  'Rate',
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
                              _link = value;
                            });
                          },
                          controller: _linkController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'Link',
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
                              _usages = value;
                            });
                          },
                          controller: _usagesController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'Usages',
                              size.height > diviceSize ? 30 : 18,
                              Icon(
                                Icons.map,
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
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            setState(() {
                              _notes = value;
                            });
                          },
                          controller: _notesController,
                          style: TextStyle(
                              color: Colors.yellow[300],
                              fontSize: size.height > diviceSize ? 30 : 18),
                          decoration: _textDecoration(
                              'Notes',
                              size.height > diviceSize ? 30 : 18,
                              Icon(
                                Icons.bookmark_border,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            decoration: new BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.green, Colors.green]),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(50.0)),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.blue,
                                child: SizedBox(
                                    width: size.height > diviceSize ? 80 : 50,
                                    height: size.height > diviceSize ? 80 : 50,
                                    child: Icon(
                                      Icons.compare_arrows,
                                      size: size.height > diviceSize ? 40 : 20,
                                    )),
                                onTap: () {
                                  _whatController.clear();
                                  _whereController.clear();
                                  _whoController.clear();
                                  _usagesController.clear();
                                  _notesController.clear();
                                  _rateController.clear();
                                  _linkController.clear();
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  print(_what);
                                  print(_where);
                                  print(_rate);
                                  print(_dateTime);
                                  print(_link);
                                  print(_who);
                                  print(_usages);
                                  print(_notes);

                                  Navigator.of(context)
                                      .pushNamed('/project-details');
                                },
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
          )
        ],
      ),
    );
  }
}
