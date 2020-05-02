//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calendar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected ${day.toString()}');
    // setState(() {
    //   _selectedEvents = events;
    // });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format, CalendarController controller) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format, CalendarController controller) {
    print('CALLBACK: _onCalendarCreated');
  }

  List dater() {
    var now = new DateTime.now();
    var myList = [];

    for (int i = 1; i <= 12; i++) {
      myList.add(_buildTableCalendarWithBuilders(new DateTime(now.year, i), new DateTime(now.year, i + 1, 0)));
    }

    // myList.add(_buildTableCalendarWithBuilders(new DateTime(now.year, 9), new DateTime(now.year, 10, 0)));

    return myList;
  }

  List cycler() {
    var now = new DateTime.now();
    var myList = [];

    for (int i = 1; i <= 12; i++) {
      // myList.add(_buildTableCalendarWithBuilders(new DateTime(now.year, i), new DateTime(now.year, i + 1, 0)));
    }

    myList.add(_buildTableCalendarWithBuilders(new DateTime(now.year, 5, 4), new DateTime(now.year, 6, 11)));

    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ...cycler(),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendarWithBuilders(DateTime startMonth, DateTime endMonth) {
    print("$startMonth + $endMonth");
    return TableCalendar(
      locale: 'en_US',
      headerVisible: true,
      startDay: startMonth,
      endDay: endMonth,
      initialSelectedDay: startMonth,
      initialCalendarFormat: CalendarFormat.free,
      startingDayOfWeek: StartingDayOfWeek.monday,
      disableGestures: true,
      calendarStyle: CalendarStyle(
        contentPadding: EdgeInsets.all(0),
        outsideDaysVisible: false,
        weekdayStyle: TextStyle().copyWith(color: Colors.blue[800]),
        weekendStyle: TextStyle().copyWith(color: Colors.yellow[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.green[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        showLeftChevron: false,
        showRightChevron: false,
        headerMargin: EdgeInsets.only(left: 16, bottom: 0),
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        dayBuilder: (context, date, list, controller) {
          if (date.day > 18 && date.day < 27) {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color(0xfff9cb86),
                      border: Border.all(width: 0, color: Color(0xfff9cb86)),
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.lightbulb_outline,
                        size: 15.0,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.drag_handle,
                        size: 15.0,
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 11,
                  minHeight: 11,
                ),
                child: Container(
                  height: 11,
                  width: 11,
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      // color: Color(0xfff9cb86),
                      // border: Border.all(width: 0, color: Color(0xfff9cb86)),
                      ),
                  child: Text(
                    '${date.day}',
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }
        },
      ),
      onDaySelected: (date, events, controller) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }
}
