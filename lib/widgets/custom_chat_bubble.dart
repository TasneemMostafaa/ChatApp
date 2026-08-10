import 'package:chatapp/constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //height: 65,
        //width: 150,
        //alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimaryColor,
        ),
        child: Text( message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key, required this.message});

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        //height: 65,
        //width: 150,
        //alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.blueGrey,
        ),
        child: Text( message.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
