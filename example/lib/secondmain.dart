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
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController1;
  CalendarController _calendarController2;
  CalendarController _calendarController3;
  CalendarController _calendarController4;
  CalendarController _calendarController5;
  CalendarController _calendarController6;
  CalendarController _calendarController7;
  CalendarController _calendarController8;
  CalendarController _calendarController9;
  CalendarController _calendarController10;
  CalendarController _calendarController11;
  CalendarController _calendarController12;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): ['Event A0', 'Event B0', 'Event C0'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): ['Event A2', 'Event B2', 'Event C2', 'Event D2'],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): ['Event A4', 'Event B4', 'Event C4'],
      _selectedDay.subtract(Duration(days: 4)): ['Event A5', 'Event B5', 'Event C5'],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): ['Event A8', 'Event B8', 'Event C8', 'Event D8'],
      _selectedDay.add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): ['Event A10', 'Event B10', 'Event C10'],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): ['Event A12', 'Event B12', 'Event C12', 'Event D12'],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): ['Event A14', 'Event B14', 'Event C14'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController1 = CalendarController();
    _calendarController2 = CalendarController();
    _calendarController3 = CalendarController();
    _calendarController4 = CalendarController();
    _calendarController5 = CalendarController();
    _calendarController6 = CalendarController();
    _calendarController7 = CalendarController();
    _calendarController8 = CalendarController();
    _calendarController9 = CalendarController();
    _calendarController10 = CalendarController();
    _calendarController11 = CalendarController();
    _calendarController12 = CalendarController();

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
            ...dater()
            // _buildTableCalendarWithBuilders(),
            // const SizedBox(height: 8.0),
            // _buildButtons(),
            // const SizedBox(height: 8.0),
            // Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  // // Simple TableCalendar configuration (using Styles)
  // Widget _buildTableCalendar() {
  //   return TableCalendar(
  //     calendarController: _calendarController,
  //     events: _events,
  //     holidays: _holidays,
  //     startingDayOfWeek: StartingDayOfWeek.monday,
  //     calendarStyle: CalendarStyle(
  //       selectedColor: Colors.deepOrange[400],
  //       todayColor: Colors.deepOrange[200],
  //       markersColor: Colors.brown[700],
  //       outsideDaysVisible: false,
  //     ),
  //     headerStyle: HeaderStyle(
  //       formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
  //       formatButtonDecoration: BoxDecoration(
  //         color: Colors.deepOrange[400],
  //         borderRadius: BorderRadius.circular(16.0),
  //       ),
  //     ),
  //     onDaySelected: _onDaySelected,
  //     onVisibleDaysChanged: _onVisibleDaysChanged,
  //     onCalendarCreated: _onCalendarCreated,
  //   );
  // }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders(DateTime startMonth, DateTime endMonth) {
    print("$startMonth + $endMonth");
    return TableCalendar(
      locale: 'en_US',
      headerVisible: true,
      startDay: startMonth,
      endDay: endMonth,
      initialSelectedDay: startMonth,
      // calendarController: CalendarController(),
      // rowHeight: 21,
      // events: _events,
      // holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      // disableGestures: false,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        contentPadding: EdgeInsets.all(0),
        outsideDaysVisible: false,
        // markersColor: Colors.brown[700],
        weekdayStyle: TextStyle().copyWith(color: Colors.blue[800]),
        weekendStyle: TextStyle().copyWith(color: Colors.yellow[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.green[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        // showLeftChevron: false,
        // showRightChevron: false,
        headerMargin: EdgeInsets.all(0),
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
        // selectedDayBuilder: (context, date, _) {
        //   return FadeTransition(
        //     opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
        //     child: Container(
        //       margin: const EdgeInsets.only(bottom: 5),
        //       color: Colors.blue[300],
        //       child: Text(
        //         '${date.day}',
        //         style: TextStyle().copyWith(fontSize: 15.0, fontWeight: FontWeight.w500),
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   );
        // },
        // todayDayBuilder: (context, date, _) {
        //   return Container(
        //     margin: const EdgeInsets.all(4.0),
        //     padding: const EdgeInsets.only(top: 5.0, left: 6.0),
        //     color: Colors.amber[400],
        //     width: 30,
        //     height: 16,
        //     child: Text(
        //       '${date.day}',
        //       style: TextStyle().copyWith(fontSize: 16.0),
        //     ),
        //   );
        // },
        // markersBuilder: (context, date, controller, events, holidays) {
        //   final children = <Widget>[];

        //   if (events.isNotEmpty) {
        //     children.add(
        //       Positioned(
        //         bottom: -10,
        //         child: _buildEventsMarker(date, controller, events),
        //       ),
        //     );
        //   }

        //   // if (holidays.isNotEmpty) {
        //   //   children.add(
        //   //     Positioned(
        //   //       right: -2,
        //   //       top: -2,
        //   //       child: _buildHolidaysMarker(),
        //   //     ),
        //   //   );
        //   // }

        //   return children;
        // },
        // singleMarkerBuilder: (context, date, controller, events) {
        //   // final children = <Widget>[];
        //   if (events.isNotEmpty) {
        //     return _buildEventsMarker(date, controller);
        //   } else {
        //     return Container(
        //       width: 0,
        //       height: 0,
        //     );
        //   }

        //   // if (events.isNotEmpty) {
        //   //   children.add(
        //   //     Positioned(
        //   //       bottom: -10,
        //   //       child: _buildEventsMarker(date, controller, events),
        //   //     ),
        //   //   );
        //   // }

        //   // if (holidays.isNotEmpty) {
        //   //   children.add(
        //   //     Positioned(
        //   //       right: -2,
        //   //       top: -2,
        //   //       child: _buildHolidaysMarker(),
        //   //     ),
        //   //   );
        //   // }
        // },
      ),
      onDaySelected: (date, events, controller) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events, CalendarController controller) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: controller.isSelected(date)
            ? Colors.brown[500]
            : controller.isToday(date) ? Colors.brown[300] : Colors.blue[400],
      ),
      width: 10.0,
      height: 10.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  // Widget _buildHolidaysMarker() {
  //   return Icon(
  //     Icons.add_box,
  //     size: 20.0,
  //     color: Colors.blueGrey[800],
  //   );
  // }

  // Widget _buildButtons() {
  //   final dateTime = _events.keys.elementAt(_events.length - 2);

  //   return Column(
  //     children: <Widget>[
  //       Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: <Widget>[
  //           RaisedButton(
  //             child: Text('Month'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController.setCalendarFormat(CalendarFormat.month);
  //               });
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('2 weeks'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController.setCalendarFormat(CalendarFormat.twoWeeks);
  //               });
  //             },
  //           ),
  //           RaisedButton(
  //             child: Text('Week'),
  //             onPressed: () {
  //               setState(() {
  //                 _calendarController.setCalendarFormat(CalendarFormat.week);
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 8.0),
  //       RaisedButton(
  //         child: Text('Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
  //         onPressed: () {
  //           _calendarController.setSelectedDay(
  //             DateTime(dateTime.year, dateTime.month, dateTime.day),
  //             runCallback: true,
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
