import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nagisa_talk/chatDetailPage.dart';
import 'package:nagisa_talk/models/conversationModel.dart';
import 'package:nagisa_talk/models/studentsModel.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:logger/logger.dart';

class ConversationList extends StatefulWidget {
  late final Conversation conversation;

  ConversationList({required this.conversation});

  List<ImageProvider<Object>> participatedStudentsAvatar = [];

  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  final logger = Logger();

  void updateStudentAvatars() {
    widget.participatedStudentsAvatar = [];
    for (var student in widget.conversation.participatedStudents) {
      widget.participatedStudentsAvatar.add(FileImage(File(student.imageUrl)));
      logger.i(student.imageUrl);
    }
  }

  @override
  initState() {
    super.initState();

    logger.i("Init!");
  }

  @override
  Widget build(BuildContext context) {
    updateStudentAvatars();
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          //return ChatDetailPage(messages: [], participatingStudents: widget.conversation.participatedStudents,);
          return ChatDetailPage(participatingStudents: widget.conversation.participatedStudents,);
        }));
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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.1),
                    child: AvatarStack(
                        avatars: widget.participatedStudentsAvatar, height: 60),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.conversation.conversationName,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            (widget.conversation.messages.isEmpty)?"":widget.conversation.messages.last.messageText,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
