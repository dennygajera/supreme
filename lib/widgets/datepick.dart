import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime _firstDate;
  DateTime _lastDate;
  double divSize = 470;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: ThemeData.dark().copyWith(
                accentColor: Color.fromRGBO(201, 163, 66, 1),
                canvasColor: Color.fromRGBO(201, 163, 66, 1),
                backgroundColor: Color.fromRGBO(201, 163, 66, 1),
                buttonTheme: ButtonThemeData(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: Colors.amber,
                      ),
                ),
              ),
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () async {
                    _firstDate = null;
                    _lastDate = null;
                    List<DateTime> dateTime =
                        await DateRangePicker.showDatePicker(
                            context: context,
                            initialFirstDate: DateTime.now(),
                            initialLastDate: DateTime.now(),
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1)),
                            lastDate: DateTime(DateTime.now().year + 5));
                    print(dateTime[0]);
                    if (dateTime != null && dateTime.length == 1) {
                      setState(() {
                        _firstDate = dateTime[0];
                      });
                      print(" Choose Only One date" +
                          _firstDate.toIso8601String());
                    }
                    if (dateTime != null && dateTime.length == 2) {
                      setState(() {
                        _firstDate = dateTime[0];
                        _lastDate = dateTime[1];
                      });
                      print(_firstDate);
                    }
                    print(_firstDate);
                  },
                  child: Container(
                    width: size.height > divSize ? 320 : 200,
                    height: size.height > divSize ? 80 : 60,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border(bottom: BorderSide(color: Colors.yellow))),
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          margin: EdgeInsets.only(right: 0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 15,
                            child: Image.asset('assets/icons/calender.png'),
                          ),
                        ),
                        Padding(
                          padding: size.height > divSize
                              ? const EdgeInsets.only(top: 0.0)
                              : const EdgeInsets.only(top: 8.0, bottom: 5),
                          child: Text(
                            _firstDate == null && _lastDate == null
                                ? ' ${DateFormat("dd-MMM-yyyy").format(DateTime.now())} '
                                : _firstDate != null && _lastDate == null
                                    ? '${DateFormat("dd-MMM-yyyy").format(_firstDate)}'
                                    : '${DateFormat("dd-MMM").format(_firstDate)} | ${DateFormat("dd-MMM-yyyy").format(_lastDate)}',
                            style: TextStyle(
                                fontSize: size.height > divSize ? 20 : 14,
                                color: Colors.amber),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
