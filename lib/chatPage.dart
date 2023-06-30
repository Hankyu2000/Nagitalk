import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/models/messageModel.dart';
import 'package:nagisa_talk/widgets/conversationList.dart';
import 'package:nagisa_talk/models/studentsModel.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [
    Message(students: [Student(uuid: "7310f918-55a4-406c-bd3a-4fcd1c7963be", name: "桐藤 ナギサ", imageUrl: "E:\\Docs/7310f918-55a4-406c-bd3a-4fcd1c7963be.png", schoolName: "トリニティ総合学園")], messageText: "ごきげんよう、先生。", time: "Now", messageUUID: "7310f918-55a4-406c-bd3a-4fcd1c7963be"),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.hConversations,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  student: messages[index].students[index],
                  messageText: messages[index].messageText,
                  time: messages[index].time,
                  messageUUID: messages[index].messageUUID,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}