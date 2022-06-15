import 'package:flutter/material.dart';
import 'package:flash_chat/screens/chat_screen.dart';
class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text,required this.isMe});

  final bool isMe ;
  final String sender;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: [
          Text(sender,style: const TextStyle(color: Colors.black54,fontSize: 12.0),),
          Material(
            borderRadius: isMe?  const BorderRadius.only(
                topLeft:Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0) ): const BorderRadius.only(
                topRight:Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0) ) ,
            elevation: 5.0,
            color: isMe? Colors.lightBlueAccent:Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                '$text',
                style:TextStyle(
                  color: isMe? Colors.white: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
