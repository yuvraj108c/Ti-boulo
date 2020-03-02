import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ti_boulo/widgets/MyAppBar.dart';

class DashChatScreen extends StatefulWidget {
  final String args;
  DashChatScreen({Key key, this.args}) : super(key: key);

  @override
  _DashChatState createState() => _DashChatState();
}

class _DashChatState extends State<DashChatScreen> {
  String username, usertype, chatid;
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  ChatUser user, otherUser;

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();

  @override
  void initState() {
    super.initState();
    username = widget.args.split("|")[0];
    usertype = widget.args.split("|")[1];
    chatid = widget.args.split("|")[2];
    print("chatid: $chatid");

    loadUsers(); // TODO: Ensure this is run first. otherwise you'll get an error

  }

  void onSend(ChatMessage message) {
    print(message.toJson());
    var documentReference = Firestore.instance
        .collection('chats')
        .document(chatid)
        .collection("messages")
        .document(DateTime.now().millisecondsSinceEpoch.toString());

    Firestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
    setState(() {
      messages = [...messages, message];
      print(messages.length);
    });
  }

  Future<void> loadUsers() async {
    String othertype = usertype == "freelancer" ? "hirer" : "freelancer";
    Firestore _firestore = Firestore.instance;
    _firestore.collection("chats").document(chatid).get().then((doc) {
      user = new ChatUser(
        name: doc.data[usertype]["username"],
        uid: doc.data[usertype]["username"],
        avatar: doc.data[usertype]["avatar"],
      );
      otherUser = new ChatUser(
        name: doc.data[othertype]["username"],
        uid: doc.data[othertype]["username"],
        avatar: doc.data[othertype]["avatar"],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Chat with $username",
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats')
            .document(chatid)
            .collection("messages")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            );
          } else {
            List<DocumentSnapshot> items = snapshot.data.documents;
            var messages =
                items.map((i) => ChatMessage.fromJson(i.data)).toList();
            return DashChat(
              height: MediaQuery.of(context).size.height - 80.0,
              key: _chatViewKey,
              inverted: false,
              onSend: onSend,
              user: user,
              inputDecoration:
                  InputDecoration.collapsed(hintText: "Add message here..."),
              dateFormat: DateFormat('yyyy-MMM-dd'),
              timeFormat: DateFormat('HH:mm'),
              messages: messages,
              showUserAvatar: true,
              showAvatarForEveryMessage: false,
              scrollToBottom: true,
              onPressAvatar: (ChatUser user) {
                print("OnPressAvatar: ${user.name}");
              },
              onLongPressAvatar: (ChatUser user) {
                print("OnLongPressAvatar: ${user.name}");
              },
              inputMaxLines: 5,
              alwaysShowSend: true,
              inputTextStyle: TextStyle(fontSize: 16.0),
              inputContainerStyle: BoxDecoration(
                border: Border.all(width: 0.0),
                color: Colors.white,
              ),
              onQuickReply: (Reply reply) {
                setState(() {
                  messages.add(ChatMessage(
                      text: reply.value,
                      createdAt: DateTime.now(),
                      user: user));

                  messages = [...messages];
                });

                Timer(Duration(milliseconds: 300), () {
                  _chatViewKey.currentState.scrollController
                    ..animateTo(
                      _chatViewKey.currentState.scrollController.position
                          .maxScrollExtent,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                });
              },
              onLoadEarlier: () {
                print("laoding...");
              },
              shouldShowLoadEarlier: false,
              showTraillingBeforeSend: true,
              trailing: <Widget>[
                IconButton(
                  icon: Icon(Icons.photo),
                  onPressed: () async {
                    File result = await ImagePicker.pickImage(
                      source: ImageSource.gallery,
                      imageQuality: 80,
                      maxHeight: 400,
                      maxWidth: 400,
                    );

                    if (result != null) {
                      final StorageReference storageRef =
                          FirebaseStorage.instance.ref().child("chat_images");

                      StorageUploadTask uploadTask = storageRef.putFile(
                        result,
                        StorageMetadata(
                          contentType: 'image/jpg',
                        ),
                      );
                      StorageTaskSnapshot download =
                          await uploadTask.onComplete;

                      String url = await download.ref.getDownloadURL();

                      ChatMessage message =
                          ChatMessage(text: "", user: user, image: url);

                      var documentReference = Firestore.instance
                          .collection('messages')
                          .document(
                              DateTime.now().millisecondsSinceEpoch.toString());

                      Firestore.instance.runTransaction((transaction) async {
                        await transaction.set(
                          documentReference,
                          message.toJson(),
                        );
                      });
                    }
                  },
                )
              ],
            );
          }
        },
      ),
    );
  }
}
