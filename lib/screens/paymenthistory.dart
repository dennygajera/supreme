import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/helpers/slider/bottomdownsliderprovider.dart';
import 'package:login/helpers/slider/bottomupsliderprovider.dart';
import 'package:login/helpers/membersprovider.dart';
import 'package:login/helpers/transactionprovider.dart';
import 'package:login/screens/searchmember.dart';
import 'package:login/widgets/ease_in_widget.dart';
import 'package:login/widgets/pagebackground.dart';
import 'package:provider/provider.dart';

class PaymentHistory extends StatefulWidget {
  final int selectIndex = 0;

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final divSize = 470;
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    double screenWidth = MediaQuery.of(context).size.width;
    int select = widget.selectIndex > 0 ? widget.selectIndex : 0;
    _scrollController = ScrollController(
      initialScrollOffset: (3000 + select) * (screenWidth - 40) / 7,
    );
    _scrollController2 = ScrollController(
        initialScrollOffset: (3000 + select) * (screenWidth - 40) / 7);
  }

  @override
  Widget build(BuildContext context) {
    final bottomUpIconData = Provider.of<BottomUpSliderProvider>(context);
    final bottomUpSlider = bottomUpIconData.items;
    final bottomDownIconData = Provider.of<BottomDownSliderProvider>(context);
    final bottomDownSlider = bottomDownIconData.items;
    final transaction = Provider.of<TransactionProvider>(context).items;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageBackground(
            size: size,
            imagePath: 'assets/background.png',
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleBar(size: size, divSize: divSize),
                  SizedBox(
                    height: size.height > divSize ? 20 : 28,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: size.height - 175,
                        // color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$ 5000.00",
                              style: TextStyle(
                                color: Colors.amber[300],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                height: 150,
                                child:
                                    Image.asset('assets/supremecardimage.png'),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Expanded(
                        child: Container(
                          height: size.height - 175,
                          child: ListView.builder(
                            itemBuilder: (context, i) => Container(
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          transaction[i].transId.toString(),
                                          style: TextStyle(
                                              color: Colors.amber[300]),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          DateFormat("dd-mmmm-yyyy")
                                              .format(transaction[i].tranDate),
                                          style: TextStyle(
                                              color: Colors.amber[300]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "-\$ ${transaction[i].amount}",
                                          style: TextStyle(
                                              color: Colors.amber[300]),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          transaction[i].status
                                              ? "Successfully"
                                              : "Unsuccessfullly",
                                          style: TextStyle(
                                              color: Colors.amber[300]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Image.asset('assets/icons/gym.png'),
                                  )
                                ],
                              ),
                            ),
                            itemCount: transaction.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: size.height > divSize ? 40 : 30,
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
                              radius: size.height > divSize ? 40 : 30,
                              child:
                                  Image.asset('assets/icons/loginbubble.png')),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: size.height > divSize
                        ? const EdgeInsets.only(top: 98.0)
                        : const EdgeInsets.only(top: 0.0),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: size.height > divSize ? 110 : 40,
                        width: size.height > divSize ? 1000 : size.width,
                        child: ListView.builder(
                          itemExtent: size.width / 9,
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => Container(
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: size.height > divSize
                                      ? EdgeInsets.symmetric(horizontal: 10)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 0),
                                  child: Padding(
                                    padding: size.height > divSize
                                        ? EdgeInsets.symmetric(horizontal: 0)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10),
                                    child: EaseInWidget(
                                        radius: 30,
                                        image: bottomUpSlider[
                                                i % bottomUpSlider.length]
                                            .image,
                                        secondImage: bottomUpSlider[
                                                i % bottomUpSlider.length]
                                            .image,
                                        onTap: () {
                                          print(bottomUpSlider[
                                                  i % bottomUpSlider.length]
                                              .image);
                                          _scroll();
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: bottomUpSlider.length * 10000,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            height: size.height > divSize ? 110 : 40,
                            width: size.height > divSize ? 1000 : size.width,
                            child: ListView.builder(
                              controller: _scrollController2,
                              scrollDirection: Axis.horizontal,
                              itemExtent: size.width / 9,
                              reverse: true,
                              shrinkWrap: true,
                              itemBuilder: (_, i) => Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: size.height > divSize
                                        ? EdgeInsets.symmetric(horizontal: 10)
                                        : const EdgeInsets.symmetric(
                                            horizontal: 10),
                                    child: EaseInWidget(
                                        radius: 30,
                                        image: bottomDownSlider[
                                                i % bottomDownSlider.length]
                                            .image,
                                        secondImage: bottomDownSlider[
                                                i % bottomDownSlider.length]
                                            .image,
                                        onTap: () {
                                          print(bottomDownSlider[
                                                  i % bottomDownSlider.length]
                                              .image);
                                          _scroll();
                                        }),
                                  ),
                                ],
                              ),
                              itemCount: bottomDownSlider.length * 10000,
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
        ],
      ),
    );
  }

  int speedFactor = 20;

  _scroll() {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;
    _scrollController.animateTo(maxExtent,
        duration: Duration(seconds: durationDouble.toInt()),
        curve: Curves.linear);

    double maxExtent2 = _scrollController.position.maxScrollExtent;
    double distanceDifference2 = maxExtent - _scrollController.offset;
    double durationDouble2 = distanceDifference2 / speedFactor;
    _scrollController2.animateTo(maxExtent2,
        duration: Duration(seconds: durationDouble2.toInt()),
        curve: Curves.linear);
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
    @required this.size,
    @required this.divSize,
  }) : super(key: key);

  final Size size;
  final int divSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ShaderMask(
          shaderCallback: (bounds) => RadialGradient(
            colors: [Colors.white, Colors.yellow[400], Colors.white],
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
            "Payment History",
            style: TextStyle(
              color: Colors.amber[200],
              fontSize: size.height > divSize ? 40 : 22,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/service-provider'),
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
