import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/helpers/membersprovider.dart';
import 'package:login/screens/paymenthistory.dart';
import 'package:login/screens/searchmember.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:login/widgets/sliderightroute.dart';
import 'package:provider/provider.dart';

class AllContract extends StatelessWidget {
  final divSize = 470;

  @override
  Widget build(BuildContext context) {
    final memberData = Provider.of<MembersProvider>(context).items;

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageBackground(
            size: size,
            imagePath: 'assets/background.png',
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
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
                    Container(
                      child: Text(
                        "All Contract",
                        style: TextStyle(
                          color: Colors.amber[200],
                          fontSize: size.height > divSize ? 40 : 22,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        SlideRightRoute(
                          page: PaymentHistory(),
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
                  height: size.height > divSize ? 20 : 28,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: ProjectColumn(
                            title: "FUTURE",
                            size: size,
                            memberData: memberData,
                            divSize: divSize),
                      )),
                      Expanded(
                          child: Container(
                        child: ProjectColumn(
                            title: "NOW",
                            size: size,
                            memberData: memberData,
                            divSize: divSize),
                      )),
                      Expanded(
                          child: Container(
                        child: ProjectColumn(
                            title: "PAST",
                            size: size,
                            memberData: memberData,
                            divSize: divSize),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectColumn extends StatelessWidget {
  const ProjectColumn({
    Key key,
    @required this.size,
    @required this.memberData,
    @required this.divSize,
    @required this.title,
  }) : super(key: key);

  final Size size;
  final List<Member> memberData;
  final int divSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.amber[300],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: size.height - 137,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    memberData[i].name,
                    style: TextStyle(
                      color: Colors.amber[200],
                      fontSize: size.height > divSize ? 35 : 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconAndName(
                      size: size,
                      diviceSize: divSize,
                      icon: Icon(
                        Icons.attach_money,
                        color: Colors.white54,
                        size: size.height > divSize ? 25 : 15,
                      ),
                      name: (memberData[i].amount).toString(),
                    ),
                    IconAndName(
                      size: size,
                      diviceSize: divSize,
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white54,
                        size: size.height > divSize ? 25 : 15,
                      ),
                      name: memberData[i].location,
                    ),
                  ],
                ),
                IconAndName(
                  size: size,
                  diviceSize: divSize,
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.white54,
                    size: size.height > divSize ? 25 : 15,
                  ),
                  name: DateFormat("dd-MMMM").format(DateTime.now()) +
                      " | " +
                      DateFormat("dd-MMMM-yyyy").format(DateTime.now()),
                ),
                Container(
                  color: Colors.amber,
                  height: 1,
                  width: 170,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            itemCount: memberData.length,
          ),
        ),
      ],
    );
  }
}
