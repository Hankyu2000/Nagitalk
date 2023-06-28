import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nagisa_talk/models/chatUserModel.dart';
import 'package:nagisa_talk/widgets/conversationList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "桐藤 ナギサ", messageText: "ごきげんよう、先生。", imageURL: "images/userImage1.jpeg", time: "Now"),
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
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ConversationList(
                  name: chatUsers[index].name,
                  messageText: chatUsers[index].messageText,
                  imageUrl: chatUsers[index].imageURL,
                  time: chatUsers[index].time,
                  isMessageRead: (index == 0 || index == 3)?true:false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}