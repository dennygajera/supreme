import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/helpers/projectdetailsprovider.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';
import 'package:provider/provider.dart';

class ProjectDetails extends StatefulWidget {
  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  var diviceSize = 470;

  @override
  Widget build(BuildContext context) {
    final projectDetails = Provider.of<ProjectDetailsProvider>(context).items;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: ClipOval(
        child: Container(
          decoration: new BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.amberAccent]),
            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue,
              child: SizedBox(
                  width: size.height > diviceSize ? 80 : 50,
                  height: size.height > diviceSize ? 80 : 50,
                  child: Icon(
                    Icons.add,
                    size: size.height > diviceSize ? 40 : 20,
                  )),
              onTap: () {
                Navigator.of(context).pushNamed('/search-member');
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black54,
      body: Stack(
        children: <Widget>[
          PageBackground(size: size, imagePath: 'assets/background.png'),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: <Widget>[
                  PageTitle(
                      size: size,
                      diviceSize: diviceSize,
                      title: "Project Details"),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: size.width / 2,
                          child: Row(
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.help,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                projectDetails[0].hotalName,
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize:
                                        size.height > diviceSize ? 25 : 18),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Logo(
                              size: size,
                              diviceSize: diviceSize,
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Text(
                              projectDetails[0].location,
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: size.height > diviceSize ? 25 : 18),
                            )
                          ],
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
                          width: size.width / 2,
                          child: Row(
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Text(
                                DateFormat("dd-MMM")
                                        .format(projectDetails[0].dateTime[0]) +
                                    " | " +
                                    DateFormat("dd-MMM-yyyy")
                                        .format(projectDetails[0].dateTime[1]),
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize:
                                        size.height > diviceSize ? 25 : 18),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Logo(
                              size: size,
                              diviceSize: diviceSize,
                              icon: Icon(
                                Icons.attach_money,
                                color: Colors.black87,
                                size: size.height > diviceSize ? 30 : 18,
                              ),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Text(
                              "\$ ${projectDetails[0].price}",
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: size.height > diviceSize ? 25 : 18),
                            )
                          ],
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
                          width: size.height > diviceSize ? 900 : 500,
                          child: Row(
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.portrait,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Expanded(
                                child: Text(
                                  projectDetails[0].names,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize:
                                        size.height > diviceSize ? 25 : 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(18.0)
                        : const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width:
                              size.height > diviceSize ? 900 : size.width - 70,
                          child: Row(
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.link,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                child: Text(
                                  projectDetails[0].website,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize:
                                        size.height > diviceSize ? 25 : 18,
                                  ),
                                ),
                              )
                            ],
                          ),
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
                          width:
                              size.height > diviceSize ? 900 : size.width - 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.map,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                width: size.width - 200,
                                height: 150,
                                child: Container(
                                  child: Text(
                                    projectDetails[0].uses,
                                    // "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize:
                                            size.height > diviceSize ? 25 : 18),
                                  ),
                                ),
                              )
                            ],
                          ),
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
                          width:
                              size.height > diviceSize ? 900 : size.width - 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Logo(
                                size: size,
                                diviceSize: diviceSize,
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: Colors.black87,
                                  size: size.height > diviceSize ? 30 : 18,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                width: size.width - 200,
                                height: 150,
                                child: Container(
                                  child: Text(
                                    projectDetails[0].notes,
                                    // "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content",
                                    style: TextStyle(
                                        color: Colors.white54,
                                        fontSize:
                                            size.height > diviceSize ? 25 : 18),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
            width: size.height > diviceSize ? 50 : 30,
            height: size.height > diviceSize ? 50 : 30,
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
