import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nagisa_talk/chatDetailPage.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:avatar_stack/avatar_stack.dart';

class ConversationList extends StatefulWidget{
  final Student student;
  final String messageText;
  final String time;
  final String messageUUID;
  ConversationList({required this.student, required this.messageText,required this.time, required this.messageUUID});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList>{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return ChatDetailPage();
            })
        );

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // CircleAvatar(
                  //   backgroundImage: FileImage(File(widget.student.imageUrl)),
                  //   maxRadius: 30,
                  // ),
                  AvatarStack(avatars: [
                    for (var n = 0; n < 15; n++)
                      NetworkImage('https://i.pravatar.cc/150?img=$n'),
                  ], height: 50,),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.student.name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(widget.messageText, style: TextStyle(fontSize: 13, color: Colors.grey.shade600, ),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(widget.time, style: TextStyle(fontSize: 12,),)
          ],
        ),
      ),
    );
  }
}