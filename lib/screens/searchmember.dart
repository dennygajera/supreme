import 'package:flutter/material.dart';
import 'package:login/helpers/membersprovider.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';
import 'package:provider/provider.dart';

class SearchMember extends StatefulWidget {
  @override
  _SearchMemberState createState() => _SearchMemberState();
}

class _SearchMemberState extends State<SearchMember> {
  var diviceSize = 470;

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
                width: fontSize == 30 ? 60 : 30,
                height: fontSize == 30 ? 60 : 30,
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
    final memberData = Provider.of<MembersProvider>(context).items;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageBackground(size: size, imagePath: 'assets/background.png'),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  PageTitle(
                      size: size,
                      diviceSize: diviceSize,
                      title: "Search Member"),
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
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      children: <Widget>[
                        Logo(
                          size: size,
                          diviceSize: diviceSize,
                          icon: Icon(
                            Icons.help,
                            color: Colors.black87,
                            size: size.height > diviceSize ? 35 : 18,
                          ),
                        ),
                        SizedBox(
                          width: size.height > diviceSize ? 20 : 10,
                        ),
                        Text(
                          "Fashion Model",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: size.height > diviceSize ? 30 : 18),
                        ),
                        SizedBox(
                          width: size.height > diviceSize ? 20 : 0,
                        ),
                        Container(
                          height: 30.0,
                          width: 2.0,
                          color: Colors.amber[200],
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                        size.height > diviceSize
                            ? SizedBox(
                                width: 10,
                              )
                            : Container(),
                        Logo(
                          size: size,
                          diviceSize: diviceSize,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.black87,
                            size: size.height > diviceSize ? 35 : 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "London",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: size.height > diviceSize ? 30 : 18),
                        ),
                        Container(
                          height: 30.0,
                          width: 2.0,
                          color: Colors.amber[200],
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                        size.height > diviceSize
                            ? SizedBox(
                                width: 10,
                              )
                            : Container(),
                        Logo(
                          size: size,
                          diviceSize: diviceSize,
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.black87,
                            size: size.height > diviceSize ? 35 : 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "22 - Jul - 2020",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: size.height > diviceSize ? 30 : 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height > diviceSize ? 30 : 10,
                  ),
                  Container(
                    child: Text(
                      "  Member",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: size.height > diviceSize ? 28 : 18),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: size.height > diviceSize ? size.width : 700,
                    height: size.height > diviceSize ? 450 : 150,
                    alignment: Alignment.topLeft,
                    color: Colors.transparent,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: memberData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // maxCrossAxisExtent: 200,
                          childAspectRatio: 1 / 0.43,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3),
                      itemBuilder: (_, i) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              memberData[i].name,
                              style: TextStyle(
                                color: Colors.amber[200],
                                fontSize: size.height > diviceSize ? 35 : 20,
                              ),
                            ),
                          ),
                          IconAndName(
                            size: size,
                            diviceSize: diviceSize,
                            icon: Icon(
                              Icons.people,
                              color: Colors.white54,
                              size: size.height > diviceSize ? 25 : 15,
                            ),
                            name: memberData[i].secondName,
                          ),
                          IconAndName(
                            size: size,
                            diviceSize: diviceSize,
                            icon: Icon(
                              Icons.attach_money,
                              color: Colors.white54,
                              size: size.height > diviceSize ? 25 : 15,
                            ),
                            name: '\$ ${memberData[i].amount}',
                          )
                        ],
                      ),
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

class IconAndName extends StatelessWidget {
  const IconAndName({
    Key key,
    @required this.size,
    @required this.diviceSize,
    @required this.icon,
    @required this.name,
  }) : super(key: key);

  final Size size;
  final int diviceSize;
  final String name;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          icon,
          SizedBox(
            width: size.height > diviceSize ? 15 : 5,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white54,
              fontSize: size.height > diviceSize ? 25 : 10,
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
