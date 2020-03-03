import 'package:flutter/material.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';

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
      body: MyDashboardBody(),
    );
  }
}

class MyDashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Dashboard"),
    );
  }
}
