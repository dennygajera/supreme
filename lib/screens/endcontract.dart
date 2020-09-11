import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/pagetitle.dart';

class EndContract extends StatefulWidget {
  @override
  _EndContractState createState() => _EndContractState();
}

class _EndContractState extends State<EndContract> {
  var diviceSize = 470;

  @override
  Widget build(BuildContext context) {
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
                    title: 'End Contract',
                  ),
                  Padding(
                    padding: size.height > diviceSize
                        ? const EdgeInsets.all(28.0)
                        : const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Project Detail",
                          style: TextStyle(
                            color: Colors.amber[300],
                            fontSize: size.height > diviceSize ? 30 : 20,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 10,
                        ),
                        Text(
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual.",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: size.height > diviceSize ? 25 : 15,
                              letterSpacing: 1.2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Responsibility",
                          style: TextStyle(
                            color: Colors.amber[300],
                            fontSize: size.height > diviceSize ? 30 : 20,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 10,
                        ),
                        Responsibility(size: size, diviceSize: diviceSize),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 5,
                        ),
                        Responsibility(size: size, diviceSize: diviceSize),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 5,
                        ),
                        Responsibility(size: size, diviceSize: diviceSize),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 5,
                        ),
                        Responsibility(size: size, diviceSize: diviceSize),
                        SizedBox(
                          height: size.height > diviceSize ? 15 : 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: size.height > diviceSize
                                              ? 40
                                              : 30,
                                          child: Image.asset(
                                              'assets/icons/loginbubble.png')),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "\$ 550.00",
                                      style: TextStyle(
                                        color: Colors.amber[300],
                                        fontSize:
                                            size.height > diviceSize ? 30 : 18,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: size.height > diviceSize
                                              ? 40
                                              : 30,
                                          child: Image.asset(
                                              'assets/icons/loginbubble.png')),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      DateFormat("dd-MMM-yyyy")
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                        color: Colors.amber[300],
                                        fontSize:
                                            size.height > diviceSize ? 30 : 18,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
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

class Responsibility extends StatelessWidget {
  const Responsibility({
    Key key,
    @required this.size,
    @required this.diviceSize,
  }) : super(key: key);

  final Size size;
  final int diviceSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.adjust,
          size: size.height > diviceSize ? 25 : 15,
          color: Colors.white54,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "Lorem ipsum is a placeholder demonstrate the visual",
          style: TextStyle(
            color: Colors.white54,
            fontSize: size.height > diviceSize ? 25 : 15,
          ),
        ),
      ],
    );
  }
}
