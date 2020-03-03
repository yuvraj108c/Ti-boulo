import 'package:flutter/material.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyCalendar.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Dashboard",
      ),
      body: MyDashboard(),
    );
  }
}

class MyDashboard extends StatelessWidget {
  final Map<DateTime, List> _events = {
    DateTime(2020, 3, 1): ['Construct wall'],
    DateTime(2020, 3, 2): ['Paint wall'],
  };

  @override
  Widget build(BuildContext context) {
    return MyCalendar(
      events: _events,
    );
  }
}
