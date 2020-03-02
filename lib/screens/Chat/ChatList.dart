import 'package:flutter/material.dart';
import 'package:ti_boulo/screens/Chat/ChatListBuilder.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';
import 'package:ti_boulo/widgets/MyDrawer.dart';

/// Chat List - List of People with which you can chat
class ChatListScreen extends StatefulWidget {
  ChatListScreen({Key key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Chats"),
      drawer: MyDrawer(),
      body: ChatListBuilder(),
    );
  }
}
