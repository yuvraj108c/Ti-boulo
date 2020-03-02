import 'package:flutter/material.dart';
import 'package:ti_boulo/models/User.dart';

import '../../constants.dart';

// Chat List Item - A Row in the Chat List
class ChatListItem extends StatelessWidget {
  final User user;
  final bool isNew;
  final Function onTap;
  final minValue = 8.0;

  ChatListItem({@required this.user, this.isNew = false, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 65.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
                backgroundColor: Colors.grey,
                radius: minValue * 3.5,
                backgroundImage: NetworkImage(user.profileImage)),
            SizedBox(
              width: minValue * 1.5,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${user.username}",
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  (user.details != null) ? "${user.details}" : "",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            )),
            isNew
                ? Container(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      'NEW',
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.white),
                    ),
                    color: kMainColor,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}