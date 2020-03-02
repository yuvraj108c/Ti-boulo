import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ti_boulo/models/User.dart';
import 'package:ti_boulo/routes.dart';
import 'package:ti_boulo/screens/Chat/ChatListItem.dart';

/// Build the list of People with which you can chat
///
/// Uses your username and usertype to find chats where userrtype: username
class ChatListBuilder extends StatefulWidget {
  ChatListBuilder({Key key}) : super(key: key);

  @override
  _ChatListBuilderState createState() => _ChatListBuilderState();
}

class _ChatListBuilderState extends State<ChatListBuilder> {
  String username;
  List<User> users = [];
  String usertype;

  Future<List<String>> fetchChats() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String u = sharedPreferences.getString("username");
    username = u;
    usertype = sharedPreferences.getString("usertype");
    String othertype = usertype=="freelancer" ? "hirer" : "freelancer";
    print("$username: $usertype");

    Firestore _firestore = Firestore.instance;
    List<String> c = [];

    _firestore
        .collection('chats')
        .where('$usertype.username', isEqualTo: u)
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              c.add(doc.documentID);
              users.add(new User.withImageDetails(
                  username: doc.data[othertype]["username"],
                  profileImage: doc.data[othertype]["avatar"],
                  details: doc.data[othertype]["about"]));
            }));

    return c;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchChats(),
        builder: (ctx, snapshot) {
          return snapshot.hasData
              ? ListView.separated(
                  padding: EdgeInsets.all(12.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    final User user = new User.withImageDetails(
                      username: users[index].username,
                      profileImage: users[index].profileImage,
                      details: users[index].details,
                    );

                    return ChatListItem(
                      onTap: () => Navigator.pushNamed(
                        ctx,
                        Routes.dash,
                        arguments: {"args": "${users[index].username}|$usertype|${snapshot.data[index]}"},
                      ),
                      user: user,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                )
              : Text("Loading");
        });
  }
}
