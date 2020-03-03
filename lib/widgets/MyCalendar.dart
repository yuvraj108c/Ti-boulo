import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';

class MyCalendar extends StatefulWidget {
  Map<DateTime, List> events;
  MyCalendar({this.events});

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  var _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      events: widget.events,
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        todayColor: kMainColor,
      ),
      onDaySelected: (date, events) => {},
    );
  }
}
