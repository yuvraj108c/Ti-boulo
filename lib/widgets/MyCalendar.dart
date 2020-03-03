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
  List _selectedEvents;

  @override
  void initState() {
    super.initState();

    final _selectedDay = DateTime.now();
    _calendarController = CalendarController();
    _selectedEvents = widget.events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TableCalendar(
          calendarController: _calendarController,
          events: widget.events,
          initialCalendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
            todayColor: kMainColor,
          ),
          onDaySelected: (date, events) => _onDaySelected(date, events),
        ),
        Expanded(child: _buildEventList())
      ],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
